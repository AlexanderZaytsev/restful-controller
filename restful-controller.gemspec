# -*- encoding: utf-8 -*-
require File.expand_path('../lib/restful_controller/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Alexander Zaytsev"]
  gem.email         = ["alexander@say26.com"]
  gem.description   = %q{Restful Controllers for your Rails app}
  gem.summary       = %q{It's like scaffolding, but invisible}
  gem.homepage      = "https://github.com/AlexanderZaytsev/restful-controller"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "restful-controller"
  gem.require_paths = ["lib"]
  gem.version       = RestfulController::VERSION

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rspec-rails'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'actionpack', '~> 3.1'
  gem.add_development_dependency 'activesupport', '~> 3.1'
  gem.add_development_dependency 'activerecord', '~> 3.1'
end
