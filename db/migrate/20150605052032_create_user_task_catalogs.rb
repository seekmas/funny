class CreateUserTaskCatalogs < ActiveRecord::Migration
  def change
    create_table :user_task_catalogs do |t|
      t.string :catalog_name
      t.boolean :available
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
