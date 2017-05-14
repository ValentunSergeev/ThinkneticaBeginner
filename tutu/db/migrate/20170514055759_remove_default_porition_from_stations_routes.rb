class RemoveDefaultPoritionFromStationsRoutes < ActiveRecord::Migration[5.0]
  def change
    change_column_default :railway_stations_routes, :position, nil
  end
end
