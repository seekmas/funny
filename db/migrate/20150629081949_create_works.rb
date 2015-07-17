class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :work_title
      t.integer :user_id
      t.text :work_description

      t.timestamps null: false
    end
  end
end
