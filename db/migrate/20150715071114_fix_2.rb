class Fix2 < ActiveRecord::Migration
  def change
    change_column :work_galleries, :phone, :string
  end
end
