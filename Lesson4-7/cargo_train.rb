require_relative('train')

class CargoTrain < Train
  def add_wagon(wagon)
    if wagon.instance_of?(CargoWagon)
      super
    else
      raise 'Invalid wagon type.'
    end
  end
end
