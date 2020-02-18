# frozen_string_literal: true

module TruemailServer
  class Router
    class Resolver
      HOME_PATH = '/'

      def self.call(resource)
        resource.eql?(HOME_PATH)
      end
    end

    def self.call(request)
      new(request).call
    end

    def initialize(request)
      @resource = request.path
      @params = request.params
      @headers = request.env
    end

    def call
      controller.call(request_data) # should returns [object, status, CONTENT_TYPE]
    end

    private

    attr_reader :resource, :params, :headers

    def controller
      TruemailServer::Router::Resolver.call(resource)
    end

    def request_data
      { params: params.transform_keys(&:to_sym), headers: headers.slice('HTTP_AUTHORIZATION') }
    end
  end
end
