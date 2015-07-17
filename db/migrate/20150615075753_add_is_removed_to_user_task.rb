class AddIsRemovedToUserTask < ActiveRecord::Migration
  def change
  	add_column :user_tasks, :is_removed, :boolean
  end
end
