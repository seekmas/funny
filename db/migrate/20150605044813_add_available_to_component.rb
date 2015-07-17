class AddAvailableToComponent < ActiveRecord::Migration
  def change
  	add_column :components, :available, :boolean
  end
end
