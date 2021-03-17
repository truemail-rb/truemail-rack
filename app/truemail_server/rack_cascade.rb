# frozen_string_literal: true

require 'logger'

module TruemailServer
  RackCascade = Rack::Builder.app do
    use Rack::CommonLogger, ::Logger.new($stdout) if System::Configuration.command_line_params[:log_stdout]
    run TruemailServer::Application
  end
end
