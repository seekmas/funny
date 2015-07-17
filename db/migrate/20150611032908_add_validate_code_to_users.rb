class AddValidateCodeToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :validate_code, :integer
  end
end
