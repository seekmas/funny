class SetUuidIndexToWork < ActiveRecord::Migration
  def change
    add_index :works, :uuid, :unique => true
  end
end
