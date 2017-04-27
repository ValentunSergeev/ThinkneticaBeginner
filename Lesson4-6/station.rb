require_relative('verifiable')
require_relative('instance_counter')

class Station
  attr_reader :name, :trains

  include Verifiable
  include InstanceCounter

  def initialize(name)
    @name = name.downcase
    @trains = []

    validate!
  end

  def add_train(train)
    return if trains.include?(train)
    @trains << train
  end

  def show_trains
    trains.each { |e| puts "Train №#{e.number} - #{e.type}" }
  end

  def show_by_type(type)
    puts "#{type.capitalize} trains in #{name} station:"
    trains.each {|e| puts "Train №#{e.number}" if e.class == type}
  end

  def delete_train(train)
    @trains.delete(train)
  end

  def valid?
    return false if name.length < NAME_MIN_LENGTH
    true
  end

  private

  NAME_MIN_LENGTH = 5
end
