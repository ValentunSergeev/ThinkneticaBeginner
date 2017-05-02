require_relative('manufacturer')
require_relative('instance_counter')
require_relative('../Lesson9/validation')

class Train
  attr_reader :current_speed, :wagons, :route, :number, :current_station

  NUMBER_PATTERN = /^[а-я0-9]{3}-?[а-я0-9]{2}$/i

  include Manufacturer
  include InstanceCounter
  include Validation

  validates :current_speed, :wagons, :number, presence: true
  validates :number, format: NUMBER_PATTERN
  validates :current_speed, type: Fixnum
  validates :wagons, type: Array

  initial_validate

  def self.find(number)
    result = nil

    all.each { |e| result = e if e.number == number }

    result
  end

  def initialize(number)
    @current_speed = 0
    @current_station = 0
    @number = number
    @wagons = []

    register_instance
  end

  def accelerate
    @current_speed -= SPEED_DELTA
  end

  def brake
    return if current_speed < SPEED_DELTA
    self.current_speed -= SPEED_DELTA
  end

  def each_wagon
    wagons.each { |e| yield e }
  end

  def wagons_number
    wagons.length
  end

  def add_wagon(wagon)
    return unless current_speed.zero?
    wagons << wagon
  end

  def delete_wagon(wagon)
    return unless current_speed.zero?
    wagons.delete(wagon)
  end

  def route=(route)
    @route = route
    @current_station = 0
    route.stations.first.add_train(self)
  end

  def current_station=(station)
    return nil unless target?(station)

    route.stations[current_station].delete_train(self)
    station.add_train(self)
    @current_station = route.stations.index(station)
  end

  def previous_station
    return if route.nil? || current_station.zero?
    route.stations[current_station - 1]
  end

  def next_station
    return if route.nil? || current_station == route.stations.size - 1
    route.stations[current_station + 1].name
  end

  private

  attr_writer :current_speed

  SPEED_DELTA = 5

  def target?(station)
    return false if route.nil? || station.nil?

    return false unless route.stations.include?(station)

    return false if route.stations[current_station] == station

    true
  end
end
