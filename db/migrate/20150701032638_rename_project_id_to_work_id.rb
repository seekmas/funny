class RenameProjectIdToWorkId < ActiveRecord::Migration
  def change
    rename_column :work_categories, :project_id, :work_id
  end
end
