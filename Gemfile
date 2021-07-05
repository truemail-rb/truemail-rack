# frozen_string_literal: true

source 'https://rubygems.org'

ruby(File.read(File.join(File.dirname(__FILE__), '.ruby-version')).strip[/-(.+)/, 1])

gem 'dry-struct', '~> 1.4'
gem 'rack', '~> 2.2', '>= 2.2.3'
gem 'thin', '~> 1.8', '>= 1.8.1'
gem 'truemail', '~> 2.4', '>= 2.4.4'

group :development, :test do
  gem 'pry-byebug', '~> 3.9'
  gem 'rack-test', '~> 1.1'
  gem 'rspec', '~> 3.10'

  # Code quality
  gem 'bundler-audit', '~> 0.8.0', require: false
  gem 'fasterer', '~> 0.9.0', require: false
  gem 'overcommit', '~> 0.58.0', require: false
  gem 'reek', '~> 6.0', '>= 6.0.4', require: false
  gem 'rubocop', '~> 1.18', '>= 1.18.2', require: false
  gem 'rubocop-performance', '~> 1.11', '>= 1.11.3', require: false
  gem 'rubocop-rspec', '~> 2.4', require: false
end

group :test do
  gem 'json_matchers', '~> 0.11.1', require: false
  gem 'simplecov', '~> 0.17.1', require: false
end
