class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name.downcase
    @trains = []
    puts "#{@name.capitalize} station has been created."
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