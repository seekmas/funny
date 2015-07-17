class AddWorkCategoryIdToWorkTask < ActiveRecord::Migration
  def change
    add_column :work_tasks, :work_category_id, :integer
  end
end
