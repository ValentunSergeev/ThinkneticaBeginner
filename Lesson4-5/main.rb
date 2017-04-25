require_relative('passenger_train')
require_relative('cargo_train')
require_relative('passenger_wagon')
require_relative('cargo_wagon')
require_relative('station')
require_relative('route')

MEMORY_PATH = __dir__ + '/memory.txt'
COMMANDS = %w(help new_train new_station set_route move_train add_wagon remove_wagon all_stations trains_in_station clear exit)
MIN_ROUTE_SIZE = 2

# ---------- AUXILIARY METHODS ----------

# @return [Train]
def get_train
  print 'Enter the train number: '
  number = gets.to_i
  train = $memory[:trains][number]
  puts 'Train with given number does not exist' if train.nil?
  train
end

# @return [Station]
def get_station(name = nil)
  print 'Enter station name: ' if name.nil?
  query = name || gets.chomp

  station = $memory[:stations][query]
  station || puts('Station with given name does not exist')
end

def create_route
  stations = []

  puts 'Enter the stations name one by one.'
  puts 'When all stations will be added, enter "finish". If you want to cancel, enter "cancel"'

  loop do
    input = gets.chomp.downcase
    case input
      when 'finish'
        stations.size >= MIN_ROUTE_SIZE ? break : puts('Too small route length.')
      when 'cancel' then
        return
      else
        station = get_station(input)
        stations << station unless station.nil?
    end
  end

  Route.new(stations)
end

# ---------- SERIALIZATION ----------

def load_memory
  $memory = Marshal.load(File.read(MEMORY_PATH))
end

def save_memory
  File.open(MEMORY_PATH, 'w') {|f| f.write(Marshal.dump($memory))}
end


# ---------- COMMANDS REALIZATION ----------

def help
  COMMANDS.each {|command| puts command}
end

def clear
  $memory = {trains: {}, stations: {}}
  save_memory
  puts 'Memory was successfully cleared.'
end

def new_train
  print 'Enter the train number: '
  number = gets.to_i

  print 'Choose train type(1 - passenger, 2 - cargo): '
  type = gets.to_i

  train = nil
  case type
    when 1
      train = PassengerTrain.new(number)
    when 2
      train = CargoTrain.new(number)
    else
      puts 'Invalid type'
  end

  $memory[:trains][number] = train
end

def new_station
  print 'Enter the station name: '
  name = gets.chomp.downcase

  $memory[:stations][name] = Station.new(name)
end

def add_wagon
  train = get_train || return

  case train
    when PassengerTrain
      train.add_wagon(PassengerWagon.new)
    when CargoWagon
      train.add_wagon(CargoWagon.new)
    else
      puts 'Train with given number does not exist.'
  end
end

def remove_wagon
  train = get_train || return
  train.delete_wagon(train.wagons.last)
end

def set_route
  train = get_train || return
  route = create_route

  train.route = route unless route.nil?
end

def move_train
  train = get_train || return
  station = get_station
  train.current_station = station
end

def all_stations
  stations = $memory[:stations]
  stations.each_key {|name| puts name.capitalize}
  Station.all
end

def trains_in_station
  station = get_station || return

  station.trains.each do |train|
    type = train.instance_of?(PassengerTrain) ? :passenger : :cargo

    puts "№#{train.number} (#{type})"
  end
end

# ---------- MAIN PROGRAM ----------

puts 'Hello its a dispatcher interface'
puts 'To find available commands, enter "help"'

load_memory

loop do
  print 'Enter the next command: '
  command = gets.chomp

  if COMMANDS.include?(command)
    send(command)
    save_memory
  else
    puts 'Undefined command. Enter "help" to see all available commands'
  end
end
