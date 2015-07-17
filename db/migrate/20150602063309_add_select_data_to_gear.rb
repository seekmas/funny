class AddSelectDataToGear < ActiveRecord::Migration
  def change
  	add_column :gears, :select_data, :text
  end
end
