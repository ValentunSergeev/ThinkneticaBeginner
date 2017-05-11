class AddDefaultsToWagonsSeats < ActiveRecord::Migration[5.0]
  def change
    change_column_default :wagons, :top_seats, 0
    change_column_default :wagons, :bottom_seats, 0
    change_column_default :wagons, :side_top_seats, 0
    change_column_default :wagons, :side_bottom_seats, 0
    change_column_default :wagons, :sitting_seats, 0
  end
end
