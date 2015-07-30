#!/usr/bin/env ruby
require 'sinatra'
require 'json'
require './lib/garage.rb'

set :server, 'thin'
set :bind, '0.0.0.0'

$lDoor = Garage::Door.new(23, 17)
$rDoor = Garage::Door.new(24, 21)

post '/left/open' do
  content_type :json
  { :result => "#{$lDoor.open}" }.to_json
end

post '/right/open' do
  content_type :json
  { :result => "#{$rDoor.open}" }.to_json
end

post '/left/close' do
  content_type :json
  { :result => "#{$lDoor.close}" }.to_json
end

post '/right/close' do
  content_type :json
  { :result => "#{$rDoor.close}" }.to_json
end

# 0 = closed, 1 = opened
get '/left/state' do
  content_type :json
  { :state => "#{$lDoor.opened}" }.to_json
end

# 0 = closed, 1 = opened
get '/right/state' do
  content_type :json
  { :state => "#{$lDoor.opened}" }.to_json
end
