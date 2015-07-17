class AddPhoneAndPasswordToUserValidates < ActiveRecord::Migration
  def change
  	add_column :user_validates, :phone, :string
  	add_column :user_validates, :password, :string
  end
end
