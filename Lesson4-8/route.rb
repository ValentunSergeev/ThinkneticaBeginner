require_relative('station')
require_relative('verifiable')

class Route
  attr_reader :stations

  include Verifiable

  def initialize(stations)
    @stations = stations

    validate!
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

  def valid?
    stations.each { |e| return false unless e.class == Station }
    return false if stations.size < MIN_SIZE
    true
  end

  private

  MIN_SIZE = 2
end
