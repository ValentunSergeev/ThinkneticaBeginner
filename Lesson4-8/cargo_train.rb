require_relative('train')

class CargoTrain < Train
  def add_wagon(wagon)
    raise 'Invalid wagon type.' unless wagon.instance_of?(CargoWagon)
    super
  end
end
