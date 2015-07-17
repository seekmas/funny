class AddTaskTypeIdToUserTask < ActiveRecord::Migration
  def change
  	add_column :user_tasks, :task_type_id, :integer
  end
end
