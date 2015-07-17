class AddBeforeTaskDaysToUserTask < ActiveRecord::Migration
  def change
  	add_column :user_tasks, :before_task_days, :integer
  end
end
