class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :get_components
  before_action :init_with_tasks

  layout :layout_by_resource

  def get_components
  	@now = DateTime.now
  end

  def get_project
  	@project = Project.find_or_create_by({ :user_id => current_user.id })
    if @project.project_date == nil
      @project.project_date = DateTime.now
      @project.save
    end
  end

  def init_with_tasks

    if current_user == nil
      return
    end

  	@project = Project.find_or_create_by({ :user_id => current_user.id })
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

  end
  protected

  def layout_by_resource
    if devise_controller?
      "default"
    else
      "application"
    end
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

end
