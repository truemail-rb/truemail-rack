# frozen_string_literal: true

source 'https://rubygems.org'

ruby(File.read(File.join(File.dirname(__FILE__), '.ruby-version')).strip[/-(.+)/, 1])

gem 'dry-struct', '~> 1.3'
gem 'rack', '~> 2.2', '>= 2.2.3'
gem 'thin', '~> 1.8'
gem 'truemail', '~> 2.2', '>= 2.2.1'

group :development, :test do
  gem 'pry-byebug', '~> 3.9'
  gem 'rack-test', '~> 1.1'
  gem 'rspec', '~> 3.10'

  # Code quality
  gem 'bundler-audit', '~> 0.7.0.1', require: false
  gem 'fasterer', '~> 0.8.3', require: false
  gem 'overcommit', '~> 0.57.0', require: false
  gem 'reek', '~> 6.0', '>= 6.0.2', require: false
  gem 'rubocop', '~> 1.5', '>= 1.5.2', require: false
  gem 'rubocop-performance', '~> 1.9', '>= 1.9.1', require: false
  gem 'rubocop-rspec', '~> 2.0', '>= 2.0.1', require: false
end

group :test do
  gem 'json_matchers', '~> 0.11.1', require: false
  gem 'simplecov', '~> 0.17.1', require: false
end
