class AddWorkTypeIdToWorkTask < ActiveRecord::Migration
  def change
    add_column :work_tasks, :task_type_id, :integer
  end
end
