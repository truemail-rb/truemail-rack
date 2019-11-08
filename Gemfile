# frozen_string_literal: true

source 'https://rubygems.org'

ruby(File.read(File.join(File.dirname(__FILE__), '.ruby-version')).strip[/-(.+)/, 1])

gem 'puma', '~> 4.2', '>= 4.2.1'
gem 'rack', '~> 2.0', '>= 2.0.7'

group :development, :test do
  gem 'pry-byebug', '~> 3.7'
  gem 'rack-test', '~> 1.1'
  gem 'rspec', '~> 3.9'

  # Code quality
  gem 'brakeman', '~> 4.7', '>= 4.7.1', require: false
  gem 'bundle-audit', '~> 0.1.0', require: false
  gem 'fasterer', '~> 0.7.1', require: false
  gem 'overcommit', '~> 0.51.0', require: false
  gem 'reek', '5.3.2', require: false
  gem 'rubocop', '~> 0.76.0', require: false
  gem 'rubocop-performance', '~> 1.5', require: false
  gem 'rubocop-rspec', '~> 1.36', require: false
end

group :test do
  gem 'simplecov', '~> 0.17.1', require: false
end
