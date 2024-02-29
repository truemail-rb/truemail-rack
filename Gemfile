# frozen_string_literal: true

source 'https://rubygems.org'

ruby(::File.read(::File.join(::File.dirname(__FILE__), '.ruby-version')).strip[/-(.+)/, 1])

gem 'dry-struct', '~> 1.6'
gem 'net-smtp', '~> 0.4.0'
gem 'rack', '~> 2.2'
gem 'thin', '~> 1.8', '>= 1.8.2'
gem 'truemail', '~> 3.1'

group :development, :test do
  gem 'pry-byebug', '~> 3.10', '>= 3.10.1'
  gem 'rack-test', '~> 2.1'
  gem 'rspec', '~> 3.12'

  # Code quality
  gem 'bundler-audit', '~> 0.9.1', require: false
  gem 'fasterer', '~> 0.10.1', require: false
  gem 'reek', '~> 6.1', '>= 6.1.4', require: false
  gem 'rubocop', '~> 1.57', '>= 1.57.2', require: false
  gem 'rubocop-performance', '~> 1.19', '>= 1.19.1', require: false
  gem 'rubocop-rspec', '~> 2.25', require: false
end

group :test do
  gem 'json_matchers', '~> 0.11.1', require: false
  gem 'simplecov', '~> 0.22.0', require: false
end
