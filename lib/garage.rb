require 'pi_piper'
include PiPiper

module Garage
  class Door
    def initialize(controlPin, sensorPin)
      @control = PiPiper::Pin.new(:pin => controlPin, :direction => :out)
      @sensor = PiPiper::Pin.new(:pin => sensorPin, :direction => :in, :pull => :down)
    end
    def open
      unless opened == 1  then
        @control.on
        sleep 1
        @control.off
        wait_for_door(20, 1)
      else
        return [1 ,'Door already open']
      end

      if result
        return [0 ,'Door opened']
      else
        return [2 ,'Tried to open door, sensor mismatch']
      end
    end
    def close
      if opened == 1 then
        @control.on
        sleep 1
        @control.off
        result = wait_for_door(20, 0)
      else
        return [1 ,'Door already closed']
      end

      if result
        return [0 ,'Door closed']
      else
        return [2 ,'Tried to close door, sensor mismatch']
      end
    end
    def opened
      return @sensor.read
    end
    def wait_for_door(timeout, desired_state)
      attempts = timeout
      until attempts == 0
        return true if @sensor.read == desired_state
        attempts = attempts - 1
        sleep 1
      end
      return false
    end
  end
end
