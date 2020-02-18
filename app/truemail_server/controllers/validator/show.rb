# frozen_string_literal: true

module TruemailServer
  module Controllers
    module Validator
      class Show < TruemailServer::Controllers::Base
        ACCESS_ERROR = 'invalid truemail access token'
        ATTRIBUTE_ERROR = 'email is required parameter'

        def call
          token, email = headers['HTTP_AUTHORIZATION'], params[:email]
          return respond_with(error(ACCESS_ERROR), 401) unless TruemailServer::Services::AccessToken.validate(token)
          return respond_with(error(ATTRIBUTE_ERROR), 422) unless email

          respond_with(TruemailServer::Services::EmailValidator.call(email), 200)
        end
      end
    end
  end
end
