class CreateUserValidates < ActiveRecord::Migration
  def change
    create_table :user_validates do |t|
      t.integer :user_id
      t.integer :validate_code
      t.boolean :is_validated

      t.timestamps null: false
    end
  end
end
