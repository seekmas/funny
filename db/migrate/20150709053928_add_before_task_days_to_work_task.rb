class AddBeforeTaskDaysToWorkTask < ActiveRecord::Migration
  def change
    add_column :work_tasks, :before_task_days, :integer
  end
end
