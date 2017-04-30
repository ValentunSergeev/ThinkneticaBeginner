require_relative('train')

class PassengerTrain < Train
  def add_wagon(wagon)
    raise 'Invalid wagon type.' unless wagon.instance_of?(PassengerWagon)
    super
  end
end
