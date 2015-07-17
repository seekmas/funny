class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name
      t.text :description
      t.boolean :is_allowed

      t.timestamps null: false
    end
  end
end
