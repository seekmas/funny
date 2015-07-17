class Fix < ActiveRecord::Migration
  def change
    remove_column :work_galleries, :phone
    add_column :work_galleries, :phone, :integer, :limit => 11
  end
end
