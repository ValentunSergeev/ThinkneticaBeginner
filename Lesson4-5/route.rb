class Route
  attr_reader :stations

  def initialize(stations = [])
    @stations = stations
  end

  def add_station(station)
    if stations.include?(station)
      puts "#{station.name.capitalize} station is already in this route."
    else
      stations << station
      puts "#{station.name.capitalize} was added to the route."
    end
  end

  def delete_station(station)
    if @stations.delete(station).nil?
      puts "#{station.name.capitalize} is not in this route"
    else
      puts "#{station.name.capitalize} station was delete from this route."
    end
  end

  def first_station
    puts "First station is a #{stations.first.name}"
  end

  def last_station
    puts "Last station is a #{stations.last.name}"
  end

  def intermediate_stations
    puts 'Intermediate stations: '
    stations[1, -2].each { |station| puts station.name }
  end
end
