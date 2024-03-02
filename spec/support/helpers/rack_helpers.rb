# frozen_string_literal: true

module RackHelpers
  def create_rack_request(path: '/', params: {}, env: {})
    instance_double(Rack::Request, path:, params:, env:)
  end

  def create_rack_response(finish: [200, {}, []])
    instance_double(Rack::Response, finish:)
  end

  def reset_command_line_params!
    System::Configuration.send(:reset_command_line_params!)
  end

  def reload_rack_cascade!
    TruemailServer.send(:remove_const, :RackCascade) # rubocop:disable RSpec/RemoveConst
    load 'app/truemail_server/rack_cascade.rb'
  end
end
