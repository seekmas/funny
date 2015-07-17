class AddInstanceToGearType < ActiveRecord::Migration
  def change
  	add_column :gear_types, :type_value, :string
  end
end
