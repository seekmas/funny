class CreateInviteLetters < ActiveRecord::Migration
  def change
    create_table :invite_letters do |t|
      t.integer :user_id
      t.text :email_list
      t.text :email_content

      t.timestamps null: false
    end
  end
end
