class CreateWorkGalleries < ActiveRecord::Migration
  def change
    create_table :work_galleries do |t|
      t.integer :work_id
      t.integer :phone
      t.boolean :is_lucky

      t.timestamps null: false
    end
  end
end
