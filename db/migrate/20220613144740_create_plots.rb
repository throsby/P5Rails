class CreatePlots < ActiveRecord::Migration[7.0]
  def change
    create_table :plots do |t|
      t.integer :water_level
      t.integer :following_plot
      t.float :dehydration_rate
      t.integer :tower_id
      t.integer :plot_number, serial: true

      t.timestamps
    end
  end
end
