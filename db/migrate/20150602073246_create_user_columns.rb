class CreateUserColumns < ActiveRecord::Migration
  def change
    create_table :user_columns do |t|
      t.string :column_value
      t.integer :gear_id
      t.integer :row_id

      t.timestamps null: false
    end
  end
end
