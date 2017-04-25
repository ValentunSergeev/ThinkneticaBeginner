require_relative('train')

class CargoTrain < Train
  def add_wagon(wagon)
    if wagon.instance_of?(CargoWagon)
      super
    else
      puts "It's not a cargo wagon."
    end
  end
end
