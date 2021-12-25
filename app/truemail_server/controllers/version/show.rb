# frozen_string_literal: true

module TruemailServer
  module Controllers
    module Version
      class Show < TruemailServer::Controllers::Base
        def call
          return respond_with(401, error(ACCESS_ERROR)) unless token_valid?

          respond_with(200, TruemailServer::Services::Environment.call)
        end
      end
    end
  end
end
