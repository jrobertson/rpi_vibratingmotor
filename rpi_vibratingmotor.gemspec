Gem::Specification.new do |s|
  s.name = 'rpi_vibratingmotor'
  s.version = '0.1.0'
  s.summary = 'Uses a vibrating motor connected to the Raspberry Pi to alert the user of a new message etc.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/rpi_vibratingmotor.rb']
  s.add_runtime_dependency('rpi', '~> 0.4', '>=0.4.5')
  s.signing_key = '../privatekeys/rpi_vibratingmotor.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/rpi_vibratingmotor'
end
