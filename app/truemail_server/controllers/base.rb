# frozen_string_literal: true

module TruemailServer
  module Controllers
    class Base
      CONTENT_TYPE = { 'Content-Type' => 'application/json' }.freeze

      def self.call(**args)
        new(args).call
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

      def respond_with(object, status)
        [object, status, CONTENT_TYPE]
      end
    end
  end
end