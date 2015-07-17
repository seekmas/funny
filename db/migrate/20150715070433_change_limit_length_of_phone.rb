class ChangeLimitLengthOfPhone < ActiveRecord::Migration
  def change
    change_column :work_galleries, :phone, :integer, :limit => 11
  end
end
