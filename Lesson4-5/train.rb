require_relative('manufacturer')
require_relative('instance_counter')

class Train
  attr_reader :speed, :wagons, :route, :number
  attr_reader :current_station

  include Manufacturer, InstanceCounter

  def self.find(number)
    result = nil

    ObjectSpace.each_object(Train) {|train| result = train if train.number == number }

    result
  end

  def initialize(number)
    @speed = 0
    @current_station = 0
    @number = number
    @wagons = []

    register_instance

    puts "Train №#{number} has been created"
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
    puts "Train №#{number} has a #{wagons.length} wagons now."
  end

  def add_wagon(wagon)
    if speed.zero?
      wagons << wagon
      puts "One wagon added to train №#{number}. It has #{wagons.length} wagons now."
    else
      puts "Train #{number} is not staying still. Stop it first"
    end
  end

  def delete_wagon(wagon)
    if speed.zero? && wagons.include?(wagon)
      wagons.delete(wagon)
      puts "One wagon removed from train №#{number}. It has #{wagons.length} wagons now."
    else
      puts "Train №#{number} is not staying still or it has not any wagons."
    end
  end


  def route=(route)
    if route.stations.size >= 2
      @route = route
      @current_station = 0
      route.stations.first.add_train(self)
      puts "Train №#{number} has a route now."
    else
      puts 'Route must have at least two stations.'
    end
  end

  def current_station=(station)
    if is_target?(station)
      route.stations[current_station].delete_train(self)
      station.add_train(self)
      @current_station = route.stations.index(station)
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

  private

  def is_target?(station)
    return false if route.nil? or station.nil?

    unless route.stations.include?(station)
      puts "#{station.name.capitalize} is not in the train №#{number} route."
      return false
    end

    if route.stations[current_station] == station
      puts "Train №#{number} is already at this station."
      return false
    end

    true
  end
end