class CreateUserTasks < ActiveRecord::Migration
  def change
    create_table :user_tasks do |t|
      t.string :task_title
      t.integer :user_task_catalog_id
      t.text :task_requirement
      t.datetime :expired_at
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
