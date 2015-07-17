class AddInternalIdToUserCatalogs < ActiveRecord::Migration
  def change
  	add_column :user_task_catalogs, :internal_id, :integer
  end
end
