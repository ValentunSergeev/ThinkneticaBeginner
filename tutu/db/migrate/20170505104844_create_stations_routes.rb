class CreateStationsRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :railway_stations_routes do |t|
      t.belongs_to :route
      t.belongs_to :railway_station
    end
  end
end
