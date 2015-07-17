module Design
	class TaskController < AdminController
			
		def index
			@task_catalog = TaskCatalog.new
			@task_catalog.tasks << Task.new

			if params[:commit]
				@task_catalog = TaskCatalog.new
				@task_catalog.update(full_tasks_params)
				redirect_to  task_edit_path(@task_catalog.id), :notice => "操作成功"
			end
		end

		def edit
			@task_catalog = TaskCatalog.find(params[:id])
			if params[:commit]

				@task_catalog.update(full_tasks_params)
				redirect_to task_edit_path(@task_catalog.id), :notice => "操作成功"
			end
		end

		def struct
			@task_catalogs =TaskCatalog.all
		end

		def task_type
			@task_type = TaskType.new
			if params[:commit]
				TaskType.find_or_create_by({ :type_name => task_type_params[:type_name] })
				redirect_to task_type_path, :notice => '添加成功'
			end
			@task_types = TaskType.all
		end

		def edit_task_type
			@task_type = TaskType.find(params[:id])

			if params[:commit]
				@task_type.update(task_type_params)
			end

		end

		def delete_task_catalog
			@task_catalog = TaskCatalog.find(params[:id])
			TaskCatalog.destroy(@task_catalog)

			redirect_to task_struct_path, :notice => "操作成功"
			return
		end

		def delete_task_item
			@task = Task.find(params[:id])
			Task.destroy(@task)
			
			redirect_to task_struct_path, :notice => "操作成功"
			return
		end

		private 

		def full_tasks_params
			params.require(:task_catalog).permit(:catalog_name, :available, :tasks_attributes => [:id, :task_title, :task_requirement, :task_type_id, :before_task_days, :_destroy] )
		end

		def task_type_params
			params.require(:task_type).permit(:type_name, :task_icon)
		end
	end
end