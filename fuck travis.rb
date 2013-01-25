#Because fuck Travis.
require 'nest_thermostat'
@nest = NestThermostat::Nest.new email: ENV['NEST_EMAIL'], password: ENV['NEST_PASSWORD']
loop do
  if @nest.temperature <= 70 and (Time.now.hour >= 8 and Time.now.hour <= 17)
    @nest.temperature = 71
  elsif @nest.temperature >= 72 and Time.now.hour == 8
    @nest.temperature = 71
  end
  sleep 10
end