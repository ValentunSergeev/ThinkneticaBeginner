class AddStationIdToTrains < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :trains, :railway_station
  end
end
