require_relative('station')
require_relative('../Lesson9/validation')

class Route
  attr_reader :stations

  include Validation

  MIN_SIZE = 2

  validates :stations, length: { min: MIN_SIZE }, type: Array
  initial_validate

  def initialize(stations)
    @stations = stations
  end

  def add_station(station)
    return if stations.include?(station) || station.class != Station
    stations << station
  end

  def delete_station(station)
    return if @stations.size < MIN_SIZE
    @stations.delete(station)
  end

  def first_station
    puts stations.first.name
  end

  def last_station
    puts stations.last.name
  end

  def intermediate_stations
    stations[1, -2].each { |station| puts station.name }
  end
end
