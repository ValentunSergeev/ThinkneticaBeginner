class AddArrivalAndDepartureTimesToStationRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :railway_stations_routes, :arrival_time, :time, default: Time.now
    add_column :railway_stations_routes, :departure_time, :time, default: Time.now
  end
end
