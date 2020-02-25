# frozen_string_literal: true

source 'https://rubygems.org'

ruby(File.read(File.join(File.dirname(__FILE__), '.ruby-version')).strip[/-(.+)/, 1])

gem 'dry-struct', '~> 1.3'
gem 'rack', '~> 2.2', '>= 2.2.2'
gem 'thin', '~> 1.7', '>= 1.7.2'
gem 'truemail', '~> 1.6'

group :development, :test do
  gem 'pry-byebug', '~> 3.8'
  gem 'rack-test', '~> 1.1'
  gem 'rspec', '~> 3.9'

  # Code quality
  gem 'bundler-audit', '~> 0.6.1', require: false
  gem 'fasterer', '~> 0.8.2', require: false
  gem 'overcommit', '~> 0.52.1', require: false
  gem 'reek', '~> 5.6', require: false
  gem 'rubocop', '~> 0.80.0', require: false
  gem 'rubocop-performance', '~> 1.5', '>= 1.5.2', require: false
  gem 'rubocop-rspec', '~> 1.38', '>= 1.38.1', require: false
end

group :test do
  gem 'json_matchers', '~> 0.11.1', require: false
  gem 'simplecov', '~> 0.17.1', require: false
end
