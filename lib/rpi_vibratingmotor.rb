#!/usr/bin/env ruby

# file: rpi_vibratingmotor.rb

require 'rpi'


class RPiVibratingMotor < RPi

  def initialize(gpio_pin)
    super(gpio_pin)    
  end

  def action_required()
    @t = Thread.new{ pin.oscillate 0.2 }
  end

  def incoming_instant_message()
    pin.oscillate 0.1, duration: 0.3
  end

  def incoming_email_message()
    pin.oscillate 0.3, duration: 0.7
  end

  def incoming_call()
    @t = Thread.new{ loop { pin.oscillate 0.5, duration: 2; sleep 3} }
  end

  def quiet_action_required()

    @t = Thread.new do
      loop {pin.oscillate 0.01, duration: 0.2; sleep 0.4}
    end

  end

  def quiet_confirmation()
    pin.oscillate 0.05, duration: 0.2
  end

  def quiet_incoming_call()

    @t = Thread.new do
      loop do
        2. times { pin.oscillate 0.01, duration: 0.3; sleep 0.5}; sleep 1.5
      end
    end

  end

  def quiet_incoming_message()
    pin.oscillate 0.01, duration: 0.5
  end
  
  def stop()
    pin.stop
    @t.exit
  end
end

if __FILE__ == $0 then

  m = RPiVibratingMotor.new(ARGV.first)
  m.incoming_instant_message()

end

