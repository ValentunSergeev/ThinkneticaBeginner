require_relative('instance_counter')
require_relative('../Lesson9/validation')

class Station
  attr_reader :name, :trains

  include Validation
  include InstanceCounter

  NAME_MIN_LENGTH = 5

  validates :name, length: { min: 5 }
  initial_validate

  def initialize(name)
    @name = name.downcase
    @trains = []
  end

  def each_train
    trains.each { |train| yield train }
  end

  def add_train(train)
    return if train.nil? || trains.include?(train)
    @trains << train
  end

  def show_trains
    trains.each { |e| puts "Train №#{e.number} - #{e.type}" }
  end

  def show_by_type(type)
    puts "#{type.capitalize} trains in #{name} station:"
    trains.each { |e| puts "Train №#{e.number}" if e.class == type }
  end

  def delete_train(train)
    @trains.delete(train)
  end
end
