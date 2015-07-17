class AddTargetDateToWorks < ActiveRecord::Migration
  def change
    add_column :works, :target_date, :date
  end
end
