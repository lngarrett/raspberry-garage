#!/usr/bin/env ruby
require 'sinatra'
require 'json'
require './lib/garage.rb'

set :server, 'thin'
set :bind, '0.0.0.0'

$lDoor = Garage::Door.new(23, 8)
$rDoor = Garage::Door.new(24, 21)

post '/left/open' do
  code, message = $lDoor.open
  content_type :json
  { :code => code, :message => message }.to_json
end

post '/right/open' do
  code, message = $rDoor.open
  content_type :json
  { :code => code, :message => message }.to_json
end

post '/left/close' do
  code, message = $lDoor.close
  content_type :json
  { :code => code, :message => message }.to_json
end

post '/right/close' do
  code, message = $rDoor.close
  content_type :json
  { :code => code, :message => message }.to_json
end

# 0 = closed, 1 = opened
get '/left/state' do
  content_type :json
  { :state => "#{$lDoor.opened}" }.to_json
end

# 0 = closed, 1 = opened
get '/right/state' do
  content_type :json
  { :state => "#{$rDoor.opened}" }.to_json
end
