module Ajax
	class TaskController < ApplicationController
		
		before_action :get_project
		layout "clean"

		def show_task
			@task = UserTask.find(params[:id])
			render @task
		end

		def get_form
			@task = UserTask.find(params[:id])
			if params[:user_task]
				@task.update(get_task_params)
				render :json => @task
			end
		end

		def finish
			@task = UserTask.find(params[:id])
			@task.done = true
			@task.save

			render :json => @task
		end

		def remove
			@task = UserTask.find(params[:id])
			@task.is_removed = true
			@task.save

			render :json => @task
		end

		def submit
			@task = UserTask.find(get_task_params[:id])
			if @task
				if @task.user_task_catalog.project_id == @project.id
					@task.update(get_task_params)

					if @task.expired_at == nil
						@task.expired_at = DateTime.now()
					end

					@task.expired_at_format = @task.expired_at.strftime('%Y.%m.%d')
					render @task
					return
				end
			end

			render :text => ''
			return
		end

		def check_task_status
			@task = UserTask.find(params[:id])
			if @task.user_task_catalog.project.user_id == current_user.id
				if @task.done == false
					@task.done = true
				else
					@task.done = false
				end

				@task.save
				render :text => '更新状态成功'
				return
			end

			render :text => '更新状态失败'
		end

		protected
		def get_task_params
			params.require(:user_task).permit(:id, :expired_at, :task_title, :task_requirement)
		end

	end
end