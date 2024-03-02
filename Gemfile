# frozen_string_literal: true

source 'https://rubygems.org'

ruby(::File.read(::File.join(::File.dirname(__FILE__), '.ruby-version')).strip[/-(.+)/, 1])

gem 'dry-struct', '~> 1.6'
gem 'net-smtp', '~> 0.4.0.1'
gem 'rack', '~> 2.2', '>= 2.2.8.1'
gem 'thin', '~> 1.8', '>= 1.8.2'
gem 'truemail', '~> 3.3'

group :development, :test do
  gem 'pry-byebug', '~> 3.10', '>= 3.10.1'
  gem 'rack-test', '~> 2.1'
  gem 'rspec', '~> 3.13'

  # Code quality
  gem 'bundler-audit', '~> 0.9.1', require: false
  gem 'fasterer', '~> 0.11.0', require: false
  gem 'reek', '~> 6.3', require: false
  gem 'rubocop', '~> 1.61', require: false
  gem 'rubocop-performance', '~> 1.20', '>= 1.20.2', require: false
  gem 'rubocop-rspec', '~> 2.27', require: false
end

group :test do
  gem 'json_matchers', '~> 0.11.1', require: false
  gem 'simplecov', '~> 0.22.0', require: false
end
