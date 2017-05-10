class RailwayStationsRoute < ApplicationRecord
  belongs_to :route
  belongs_to :railway_station

  validates :railway_station_id, uniqueness: { scope: :route_id }
end