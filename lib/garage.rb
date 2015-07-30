require 'pi_piper'
include PiPiper

module Garage
  class Door
    def initialize(controlPin, sensorPin)
      @control = PiPiper::Pin.new(:pin => controlPin, :direction => :out)
      @sensor = PiPiper::Pin.new(:pin => sensorPin, :direction => :in)
    end
    def open
      unless opened  then
        @control.on
        sleep 1
        @control.off
        sleep 5
      else
        return [1 ,'Door already open']
      end
      if opened
        return [0 ,'Door opened']
      else
        return [2 ,'Tried to open door, sensor mismatch']
      end
    end
    def close
      if opened  then
        @control.on
        sleep 1
        @control.off
        sleep 20
      else
        return [1 ,'Door already closed']
      end
      unless opened
        return [0 ,'Door closed']
      else
        return [2 ,'Tried to close door, sensor mismatch']
      end
    end
    def opened
      return @sensor.read
    end
  end
end
