class AddUuidToWork < ActiveRecord::Migration
  def change
    add_column :works, :uuid, :string
  end
end
