# frozen_string_literal: true

require 'pry'

module TruemailServer
  class Application
    def self.call(env)
      Rack::Response.new(
        *TruemailServer::Router.call(
          Rack::Request.new(env)
        )
      ).finish
    end
  end
end
