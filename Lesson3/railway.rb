class Train
  attr_reader :speed, :wagons, :route, :number, :type
  attr_reader :current_station

  def initialize(type = 'passenger', number)
    @type = type.downcase
    @speed = 0
    @current_station = -1
    @number = number
    @wagons = 0

    puts "#{type.capitalize} train №#{number} has been created"
  end

  def current_speed
    puts "Train №#{number} has a #{speed} speed now."
  end

  def accelerate
    @speed += 5

    puts "Train №#{number} accelerated. Now its speed is #{speed}"
  end

  def brake
    if speed > 0
      puts "Train №#{number} slowed down. Now its speed is #{speed}"
    else
      puts "Train №#{number} can not slow down even more. It is standing still."
    end
  end

  def wagons_number
    puts "Train №#{number} has a #{wagons} wagons now."
  end

  def add_wagon
    if speed.zero?
      puts "One wagon added to train №#{number}. It has #{wagons} wagons now."
    else
      puts "Train #{number} is not staying still. Stop it first"
    end
  end

  def delete_wagon
    if speed.zero? && wagons > 0
      @wagons -= 1
      puts "One wagon removed from train №#{number}. It has #{wagons} wagons now."
    else
      puts "Train №#{number} is not staying still or it has not any wagons."
    end
  end


  def route=(route)
    if route.stations.size > 2
      @route = route
      self.current_station = route.stations.first
      puts "Train №#{number} has a route now."
    else
      puts 'Route must have at least two stations.'
    end
  end

  def current_station=(station)
    return if route.nil?
    if route.stations.include?(station) and route.stations[current_station] == station
      @current_station = route.stations.index(station)
      station.add_train(self)
      puts "Train №#{number} moved to the #{station.name} station"
    else
      puts "#{station.name.capitalize} is not in the train №#{number} route or train is already at this station."
    end
  end

  def previous_station
    return if route.nil?
    if current_station.zero?
      puts "Train №#{number} is at the first station now."
    else
      puts "Train №#{number} previous station is a #{route.stations[current_station - 1]}"
    end
  end

  def next_station
    return if route.nil?
    if current_station == route.stations.size - 1
      puts "Train №#{number} is at the last station now."
    else
      puts "Train №#{number} next station is a #{route.stations[current_station + 1].name}"
    end
  end
end

class RailwayStation
  attr_reader :name, :trains

  def initialize(name)
    @name = name.capitalize
    @trains = []
    puts "#{name} station has been created."
  end

  def add_train(train)
    if trains.include?(train)
      puts "Train №#{train.number} is already in #{name} station."
    else
      @trains << train
      puts "Train №#{train.number} arrived to the #{name} station."
    end
  end

  def show_trains
    puts "Trains in #{name} station:"
    trains.each {|e| puts "Train №#{e.number} - #{e.type}"}
  end

  def show_by_type(type)
    puts "#{type.capitalize} trains in #{name} station:"
    trains.each {|e| puts "Train №#{e.number}" if e.type == type}
  end

  def delete_train(train)
    if @trains.delete(train).nil?
      puts "Train №#{train.number} is not in #{name} station."
    else
      puts "Train №#{train.number} left #{name} station."
    end
  end
end

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
    stations[1, -2].each {|station| puts station.name}
  end
end
