# frozen_string_literal: true

require 'truemail'

Truemail.configure do |config|
  System::Configuration.command_line_params
    .reject { |key, _| %i[access_tokens log_stdout].include?(key) }
    .each { |key, value| config.public_send("#{key}=", value) }
end
