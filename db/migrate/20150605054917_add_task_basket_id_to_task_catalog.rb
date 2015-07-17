class AddTaskBasketIdToTaskCatalog < ActiveRecord::Migration
  def change
  	add_column :task_catalogs, :task_basket_id, :integer
  end
end
