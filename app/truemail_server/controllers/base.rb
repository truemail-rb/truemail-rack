# frozen_string_literal: true

module TruemailServer
  module Controllers
    class Base
      require 'json'

      ACCESS_ERROR = 'invalid truemail access token'
      AUTHORIZATION_HEADER = 'HTTP_AUTHORIZATION'
      CONTENT_TYPE = { 'Content-Type' => 'application/json' }.freeze

      def self.call(args)
        new(**args).call
      end

      def initialize(params:, headers:)
        @params = params
        @headers = headers
      end

      def call; end

      private

      attr_reader :params, :headers

      def error(message)
        { error: message }.to_json
      end

      def respond_with(status, object = nil)
        [object, status, TruemailServer::Controllers::Base::CONTENT_TYPE]
      end

      def token_valid?
        TruemailServer::Services::AccessToken.validate(
          headers[TruemailServer::Controllers::Base::AUTHORIZATION_HEADER]
        )
      end
    end
  end
end
