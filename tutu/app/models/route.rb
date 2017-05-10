class Route < ApplicationRecord

  has_many :railway_stations_routes
  has_many :stations, through: :railway_stations_routes, source: :railway_station

  has_many :trains

  validates :name, presence: true

  def first_station
    stations.first
  end

  def last_station
    stations.last
  end
end