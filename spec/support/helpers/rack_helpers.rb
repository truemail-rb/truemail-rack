# frozen_string_literal: true

module RackHelpers
  def create_rack_request(path: '/', params: {}, env: {})
    instance_double(Rack::Request, path: path, params: params, env: env)
  end

  def create_rack_response(finish: [200, {}, []])
    instance_double(Rack::Response, finish: finish)
  end
end
