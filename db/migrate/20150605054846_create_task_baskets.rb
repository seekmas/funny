class CreateTaskBaskets < ActiveRecord::Migration
  def change
    create_table :task_baskets do |t|
      t.string :basket_name
      t.text :description
      t.boolean :available

      t.timestamps null: false
    end
  end
end
