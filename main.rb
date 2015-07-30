require 'sinatra'
require_relative 'lib/gpio.rb'

$lDoor = Garage::Door.new(23, 17)
$rDoor = Garage::Door.new(24, 21)

post '/left/open' do
  $lDoor.open
end

post '/right/open' do
  $rDoor.open
end

post '/left/close' do
  $lDoor.close
end

post '/right/close' do
  $rDoor.close
end

get '/left/state' do
  $ldoor.opened
end

get '/right/state' do
  $rdoor.opened
end
