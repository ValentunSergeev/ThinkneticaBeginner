class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  has_many :trains

  validates :title, presence: true

  def update_route_params(route, params={})
    route_station = route_station_for(route)
    if route_station.update(params)
      route.save
    end
  end

  def position_in(route)
    route_station_for(route).try(:position)
  end

  def arrival_time_in(route)
    route_station_for(route).try(:arrival_time).to_s(:time)
  end

  def departure_time_in(route)
    route_station_for(route).try(:departure_time).to_s(:time)
  end

  private


  def route_station_for(route)
    @route_station ||= railway_stations_routes.find_by(route: route)
  end
end
