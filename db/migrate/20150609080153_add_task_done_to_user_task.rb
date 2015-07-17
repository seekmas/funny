class AddTaskDoneToUserTask < ActiveRecord::Migration
  def change
  	add_column :user_tasks, :done, :boolean
  end
end
