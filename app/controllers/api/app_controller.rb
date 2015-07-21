module Api
	class AppController < ApplicationController
		skip_before_action :verify_authenticity_token

		before_action :get_valid_user, :only => [:submit_new_task, :submit_save_task]

		# v1, v2
		def submit_save_task
			#@project = Project.find_by({ :user_id => @user.id })
			#@task = UserTask.find(params[:id])
			#@task.update(get_save_task_params)
			#render :json => @task.user_task_catalog
			@task = WorkTask.find_by({ :id => params[:id], :user_id => @user.id })
			if @task
				@task.update(get_save_task_params)
				@task.save
				render :json => @task.work_category
			else
				render :json => {}
			end

		end

		# v1, v2
		def submit_new_task

			# @project = Project.find_by({ :user_id => @user.id })
			# @user_task = UserTask.new
			# @user_task.done = false
			# @user_task.is_removed = false
			# if @project.project_date
			# 	date = params[:task][:expired_at] ? params[:task][:expired_at] : DateTime.now
			# 	@user_task.before_task_days = Time.diff( @project.project_date, date, '%d')[:diff]
			# end
			# @user_task.update(get_task_params)
			# render :json => @user_task.user_task_catalog


			@work = Work.find_by({ :user_id => @user.id })
			@task = WorkTask.new
			@task.work_done = false
			@task.before_task_days = 0
			@task.user_id = @user.id
			@task.update(get_task_params)

			render :json =>@task.work_category
		end

		# v1, v2
		def get_user_task
			#@project = Project.find_by({ :user_id => params[:user_id] })
			@work = Work.find_by({ :user_id => params[:user_id] })
			@tasks = []
			if params[:task_catalog_id]
				#@catalog = UserTaskCatalog.where(:id => params[:task_catalog_id], :project_id => @project.id ).first
				@catalog = WorkCategory.where(:id => params[:task_catalog_id], :work_id => @work.id).first
			else
				#@catalog = UserTaskCatalog.where(:project_id => @project.id).first
				@catalog = WorkCategory.where(:work_id => @work.id).first
			end
			@tasks = @catalog.work_tasks.where(:work_done => false).order(:id => :desc)
			#render :json => @tasks
		end

		# v1, v2
		def get_user_task_catalogs
			#@project = Project.find_by({ :user_id => params[:user_id] })
			#@task_catalogs = UserTaskCatalog.where(:project_id => @project.id).all
			@work = Work.find_by({ :user_id => params[:user_id] })
			@task_catalogs = WorkCategory.where(:work_id => @work.id).all
		end

		# v1, v2
		def get_task_by_id
			#@project = Project.find_by({ :user_id => params[:user_id] })
			#@task = UserTask.find(params[:id])
			@work = Work.find_by({ :user_id => params[:user_id] })
			@task = WorkTask.find(params[:id])

		end

		# v1
		def get_task_types
			render :json => TaskType.all
		end

		# v1
		def signup
			@user = User.find_by({ username: get_signup_user[:username] })
			if @user == nil
				@user = User.create(get_signup_user)
				@user.save

		  	@project = Project.find_or_create_by({ :user_id => @user.id })
		    if @project.project_date == nil
		      @project.project_date = DateTime.now
		      @project.save
		    end

		  	if @task_catalogs = UserTaskCatalog.where(:project_id => @project.id).count == 0
		  		TaskCatalog.where(:available => true).all.each do |catalog|
		  			#user_task_catalog

		        counter = UserTaskCatalog.where(:project_id => @project.id).count
		        @u_t_c = UserTaskCatalog.create({
		          :catalog_name => catalog.catalog_name,
		          :project_id => @project.id,
		          :available => true ,
		          :internal_id => counter+1
		        });

		        Task.where(:task_catalog_id => catalog.id).all.each do |task|
		  				UserTask.create({
		  					:task_title => task.task_title,
		  					:task_requirement => task.task_requirement,
		  					:user_task_catalog_id => @u_t_c.id,
		            :task_type_id => task.task_type_id,
		  					:done => false,
		            :is_removed => false,
		            :before_task_days => task.before_task_days
		  				})
		  			end
		  		end
		  	end

				render :json => @user
			else
				render :json => { response: "账号已经注册过了，请登录" }
			end

		end

		protected
		# v1
		def get_signup_user
			params.require(:new_user).permit(:username, :password, :password_confirmation).merge(email: "#{params[:new_user][:username]}@hunge.me")
		end

		# v1
		def get_valid_user
			username = params[:user][:username]
			password = params[:user][:password]
			@user = User.find_by(:username => username)

			if @user
				if @user.valid_password?(password) == false
					render :json => { :response => "密码错误" }
					return
				end
			else
				render :json => { :response => "找不到用户,请重新登录" }
				return
			end
		end

		# v1
		def get_task_params
			params[:task][:task_description] = params[:task][:task_requirement]
			params[:task][:work_category_id] = params[:task][:user_task_catalog_id]
			params.require(:task).permit(:task_title, :task_description, :task_type_id, :work_category_id, :expired_at)
		end

		# v1
		def get_save_task_params
			params[:task][:task_description] = params[:task][:task_requirement]
			params.require(:task).permit(:task_title, :task_description, :expired_at)
		end

	end
end
