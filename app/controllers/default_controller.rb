class DefaultController < ApplicationController

	before_action :authenticate_user!
	before_action :get_project

	def index
		@task_types = TaskType.all
		@task_catalogs = UserTaskCatalog.where(:project_id => @project.id).order(:internal_id => :asc).all
		if params[:id]
			@task_catalog = UserTaskCatalog.where(:project_id => @project.id, :internal_id => params[:id]).first
			if @task_catalog == nil
				redirect_to sort_by_time_path(UserTaskCatalog.where(:project_id => @project.id).last.internal_id)
				return
			end
		else
			@task_catalog = UserTaskCatalog.where(:project_id => @project.id).first
		end
		@tasks = @task_catalog.user_tasks.where(:is_removed => false).order(:id => :desc).all
		@today = DateTime.now()
	end

	def new_task_at
		@task_catalog = UserTaskCatalog.find(params[:id])
		if @task_catalog
			@task = UserTask.create(
				{
					:task_title => "新的任务",
					:user_task_catalog_id => @task_catalog.id,
					:is_removed => false,
					:done => false
				}
			)
		end

		redirect_to root_path
	end

end
