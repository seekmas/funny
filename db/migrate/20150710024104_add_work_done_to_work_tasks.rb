class AddWorkDoneToWorkTasks < ActiveRecord::Migration
  def change
    add_column :work_tasks, :work_done, :boolean
  end
end
