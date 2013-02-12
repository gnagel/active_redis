# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_redis/version'

Gem::Specification.new do |gem|
  gem.name          = "active_redis"
  gem.version       = ActiveRedis::VERSION

  gem.authors       = ["Glenn Nagel"]
  gem.email         = ["glenn@mercury-wireless.com"]

  gem.summary       = %q{ActiveRedis keeps your models out of your databased.}
  gem.description   = %q{ActiveRedis is a neat way of saving data to redis and backing it upto Amazon S3.}
  gem.homepage      = "https://github.com/gnagel/active_redis"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_runtime_dependency('active_support')
  gem.add_runtime_dependency('rspec')

  gem.add_development_dependency('rspec')
  gem.add_development_dependency('ZenTest')
  
end
