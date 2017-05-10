class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  has_many :trains

  validates :title, presence: true

  def update_position(route, position)
    route_station = railway_stations_routes.find_by(route: route)
    route_station.update(position: position)
  end

  def position_in(route)
    route_station = railway_stations_routes.find_by(route: route)
    route_station.try(:position)
  end
end
