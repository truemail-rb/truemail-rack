# frozen_string_literal: true

require_relative 'system/types'
require_relative 'system/command_line_params'
require_relative 'system/configuration'

initializers = ::File.join(::File.dirname(__FILE__), '**/*.rb')
app = ::File.join(::File.expand_path('../app/truemail_server', ::File.dirname(__FILE__)), '**/*.rb')

[initializers, app].each do |path|
  ::Dir[::File.expand_path(path)].each { |file| require file }
end
