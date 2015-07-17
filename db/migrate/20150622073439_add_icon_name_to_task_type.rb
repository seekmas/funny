class AddIconNameToTaskType < ActiveRecord::Migration
  def change
  	add_column :task_types, :task_icon, :string
  end
end
