# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name    = 'html_spec'
  gem.version = '0.0.1'

  gem.authors     = ['Alex Coles']
  gem.email       = ['alex@alexbcoles.com']
  gem.summary     = 'Match HTML in RSpec'
  gem.description = 'Match HTML in RSpec'
  gem.homepage    = 'https://github.com/myabc/json_spec'
  gem.license     = 'MIT'

  gem.add_dependency 'rspec', '>= 2.0', '< 4.0'
  gem.add_dependency 'nokogiri'
  gem.add_dependency 'nokogiri-diff'

  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.add_development_dependency 'rake', '~> 10.0'

  # gem.files      = `git ls-files`.split($\)
  # gem.test_files = gem.files.grep(/^(features|spec)/)
end
