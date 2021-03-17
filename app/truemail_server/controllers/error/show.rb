# frozen_string_literal: true

module TruemailServer
  module Controllers
    module Error
      class Show < TruemailServer::Controllers::Base
        NOT_FOUND = 'resource not found'

        def call
          respond_with(404, error(TruemailServer::Controllers::Error::Show::NOT_FOUND))
        end
      end
    end
  end
end
