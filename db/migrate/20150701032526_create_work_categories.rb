class CreateWorkCategories < ActiveRecord::Migration
  def change
    create_table :work_categories do |t|
      t.string :name
      t.integer :project_id
      t.boolean :is_allowed

      t.timestamps null: false
    end
  end
end
