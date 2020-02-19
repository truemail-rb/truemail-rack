# frozen_string_literal: true

module TruemailServer
  class Router
    def self.call(request)
      new(request).call
    end

    def initialize(request)
      @resource = request.path
      @params = request.params
      @headers = request.env
    end

    def call
      controller.call(request_data)
    end

    private

    class Resolver
      def self.call(resource)
        return TruemailServer::Controllers::Validator::Show if resource.eql?('/')

        TruemailServer::Controllers::Error::Show
      end
    end

    attr_reader :resource, :params, :headers

    def controller
      TruemailServer::Router::Resolver.call(resource)
    end

    def request_data
      { params: params.transform_keys(&:to_sym), headers: headers.slice('HTTP_AUTHORIZATION') }
    end
  end
end
