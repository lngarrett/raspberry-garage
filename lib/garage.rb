require 'pi_piper'
include PiPier

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
        if opened then return true else return false end
      end
    end
    def close
      if opened  then
        @control.on
        sleep 1
        @control.off
        sleep 5
        unless opened then return true else return false end
      end
    end
    def opened
      return @sensor.read
    end
  end
end
