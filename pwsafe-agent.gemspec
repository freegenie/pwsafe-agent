# -*- encoding: utf-8 -*-
require File.expand_path('../lib/pwsafe-agent/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Fabrizio Regini"]
  gem.email         = ["freegenie@gmail.com"]
  gem.description   = %q{Avoid master password typing in pwsafe}
  gem.summary       = <<-EOH
Make pwsafe on the command line more friendly 
by avoiding the need of repetitive master password typing.
EOH

  gem.homepage      = "https://github.com/freegenie/pwsafe-agent"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "pwsafe-agent"
  gem.require_paths = ["lib"]
  gem.version       = Pwsafe::Agent::VERSION
end
