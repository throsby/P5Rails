class AddGreenhouseToTowers < ActiveRecord::Migration[7.0]
  def change
    add_column :towers, :greenhouse_id, :integer
  end
end
