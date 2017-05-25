class ChangeDepartureTimeDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :railway_stations_routes, :arrival_time, Time.now
    change_column_default :railway_stations_routes, :departure_time, Time.now + 1.hours
  end
end
