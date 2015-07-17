class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_title
      t.text :task_requirement
      t.datetime :expired_at
      t.integer :user_id
      t.integer :task_catalog_id
      t.timestamps null: false
    end
  end
end
