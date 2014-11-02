require './lib/station'
require './lib/carriage'
require './lib/train'
require './lib/passenger'


train1 = Train.new
station1 = Station.new("London Victoria")
station2 = Station.new("Clapham Junction")
passenger = Passenger.new
passenger.go_to(station1)
train1.go_to(station1)
passenger.board(train1, 0)