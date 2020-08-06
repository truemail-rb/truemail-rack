# frozen_string_literal: true

module TruemailServer
  module Controllers
    module Healthcheck
      class Show < TruemailServer::Controllers::Base
        def call
          respond_with(200)
        end
      end
    end
  end
end
