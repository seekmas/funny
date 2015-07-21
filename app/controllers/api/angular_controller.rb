module Api
  class AngularController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :find_my_work, :only => [:set_target_date, :get_calendar_format_data, :new_task_with_category]

    def index
      @user = User.find_by({ username: params[:user][:username].to_i })
      render :json => @user
    end

    def user_sign_in
      @user = User.find_by(:username => params[:user][:username].to_i)
      if @user
        if @user.valid_password?(params[:user][:password]) == true
          sign_in('user', @user)
          render :json => { :status => @user, :response => "登陆成功" }
          return
        else
          render :json => { :status => nil, :response => "账号或者密码错误" }
          return
        end

      else
        render :json => { :status => nil, :response => "账号不存在" }
        return
      end

      render :json => params
    end

    def sign_in_with
      @user = User.all.first
      sign_in(:user, @user)
      redirect_to root_path
    end

    #Sign up with phone number
    def sign_up_with_phone
      # render :json => params
      # return
      if params[:info][:username]
        @user = User.create({
          :email => "#{params[:info][:username]}@hunge.me",
          :username => params[:info][:username].to_i,
          :password => params[:info][:password],
          :password_confirmation => params[:info][:password],
          :nickname => params[:info][:nickname]

        })
        @workspace = Work.find_or_create_by({ :work_title => params[:info][:project_name], :user_id => @user.id })
        @workspace.save
        sign_in("user", @user)
        render :json => @workspace
        return
      end

      render :json => params
    end

    def send_invite_email
      @user = current_user ? current_user.id : User.all.first
      @invite_letter = InviteLetter.find_or_create_by({ :user_id => @user.id })

      @invite_letter.email_list.gsub!(/[^0-9a-zA-Z\@\.\-\,]+/, '').split(",").map(&:to_s).each do |email|
        InviteMailer.invite_email( @invite_letter, email).deliver_later
      end

      render :json => @invite_letter
    end

    def new_task_with_category
      @work = WorkTask.create({
        :task_title => params[:task_title],
        :work_id => @work.id,
        :user_id => current_user.id,
        :work_category_id => params[:work_category_id].to_i,
        :task_type_id => 0,
        :before_task_days => 0,
        :work_done => false
      })
      render :json => @work
    end

    def get_work
      @work = Work.find_or_create_by({ :user_id => current_user.id })
      render :json => @work
    end

    #Set wedding date
    def set_target_date
      new_date = params[:target_date].to_date
      @work.target_date = new_date
      @work.save
      @tasks = WorkTask.where(:work_id => @work.id).all
      @tasks.each do |task|
        if task.before_task_days
          task.expired_at = new_date - task.before_task_days.to_i.days
          task.save
        end
      end
      render :json => @work
    end

    #Set task done
    def set_task_done
      id = params[:task_id].to_i
      @task = WorkTask.find_by({ :id => id, :user_id => current_user.id })

      if @task
        if @task.work_done == false
          @task.work_done = true
        else
          @task.work_done = false
        end

        @task.save
      end

      render :json => @task
    end

    protected
    def find_my_work
      @work = Work.find_or_create_by({ :user_id => current_user.id })
    end

  end
end
