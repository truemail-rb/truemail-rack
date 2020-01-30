# frozen_string_literal: true

source 'https://rubygems.org'

ruby(File.read(File.join(File.dirname(__FILE__), '.ruby-version')).strip[/-(.+)/, 1])

gem 'rack', '~> 2.0'
gem 'thin', '~> 1.7', '>= 1.7.2'

group :development, :test do
  gem 'pry-byebug', '~> 3.7'
  gem 'rack-test', '~> 1.1'
  gem 'rspec', '~> 3.9'

  # Code quality
  gem 'bundler-audit', '~> 0.6.1', require: false
  gem 'fasterer', '~> 0.8.1', require: false
  gem 'overcommit', '~> 0.51.0', require: false
  gem 'reek', '~> 5.5', require: false
  gem 'rubocop', '~> 0.76.0', require: false
  gem 'rubocop-performance', '~> 1.5', require: false
  gem 'rubocop-rspec', '~> 1.36', require: false
end

group :test do
  gem 'simplecov', '~> 0.17.1', require: false
end
