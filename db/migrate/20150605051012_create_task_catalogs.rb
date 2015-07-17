class CreateTaskCatalogs < ActiveRecord::Migration
  def change
    create_table :task_catalogs do |t|
      t.string :catalog_name
      t.boolean :available
      
      t.timestamps null: false
    end
  end
end
