# frozen_string_literal: true

module TruemailServer
  module Controllers
    module Validator
      class Show < TruemailServer::Controllers::Base
        ACCESS_ERROR = 'invalid truemail access token'
        ATTRIBUTE_ERROR = 'email is required parameter'

        def call
          token, email = headers['HTTP_AUTHORIZATION'], params[:email]
          return respond_with(401, error(ACCESS_ERROR)) unless TruemailServer::Services::AccessToken.validate(token)
          return respond_with(422, error(ATTRIBUTE_ERROR)) unless email

          respond_with(200, TruemailServer::Services::EmailValidator.call(email))
        end
      end
    end
  end
end
