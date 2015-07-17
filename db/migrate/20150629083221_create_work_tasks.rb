class CreateWorkTasks < ActiveRecord::Migration
  def change
    create_table :work_tasks do |t|
      t.string :task_title
      t.integer :work_id
      t.date :expired_at
      t.text :task_description
      t.integer :user_id
      t.text :people_work_for
      t.text :notification_list

      t.timestamps null: false
    end
  end
end
