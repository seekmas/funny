class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.date :project_date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
