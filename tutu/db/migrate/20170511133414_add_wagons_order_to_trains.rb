class AddWagonsOrderToTrains < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :inverse_wagons_order, :boolean, default: false
  end
end
