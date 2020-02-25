# frozen_string_literal: true

module TruemailServer
  module Controllers
    module Error
      class Show < TruemailServer::Controllers::Base
        NOT_FOUND = 'resource not found'

        def call
          respond_with(error(NOT_FOUND), 404)
        end
      end
    end
  end
end
