#!/usr/bin/env ruby
require 'sinatra'
require 'json'
require './lib/garage.rb'

set :server, 'thin'
set :bind, '0.0.0.0'

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
  content_type :json
  { :state => "#{$lDoor.opened}" }.to_json
end

get '/right/state' do
  content_type :json
  { :state => "#{$lDoor.opened}" }.to_json
end
