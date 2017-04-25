require_relative('train')

class PassengerTrain < Train
  def add_wagon(wagon)
    if wagon.instance_of?(PassengerWagon)
      super
    else
      puts "It's not a passenger wagon."
    end
  end
end
