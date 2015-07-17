class CreateGears < ActiveRecord::Migration
  def change
    create_table :gears do |t|
      t.string :gear_key
      t.text :gear_description
      t.integer :gear_type_id
      t.integer :component_id

      t.timestamps null: false
    end
  end
end
