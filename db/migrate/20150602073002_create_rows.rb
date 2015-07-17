class CreateRows < ActiveRecord::Migration
  def change
    create_table :rows do |t|
      t.integer :component_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
