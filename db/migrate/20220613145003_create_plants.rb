class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :species
      t.float :water_need
      t.float :maturation_rate
      t.float :price
      t.integer :cell_id

      t.timestamps
    end
  end
end
