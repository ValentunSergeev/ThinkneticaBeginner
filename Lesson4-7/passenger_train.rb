require_relative('train')

class PassengerTrain < Train
  def add_wagon(wagon)
    if wagon.instance_of?(PassengerWagon)
      super
    else
      raise 'Invalid wagon type.'
    end
  end
end
