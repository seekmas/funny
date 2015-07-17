class AddBeforeTaskStartDaysToTask < ActiveRecord::Migration
  def change
  	add_column :tasks, :before_task_days, :integer
  end
end
