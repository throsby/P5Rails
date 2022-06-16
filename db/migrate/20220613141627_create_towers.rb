class CreateTowers < ActiveRecord::Migration[7.0]
  def change
    create_table :towers do |t|
      t.integer :next_neighbor
      t.integer :tower_number, serial: true
      t.integer :greenhouse_id

      t.timestamps
    end
  end
end
