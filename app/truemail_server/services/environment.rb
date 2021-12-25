# frozen_string_literal: true

module TruemailServer
  module Services
    class Environment
      def self.call
        {
          core: Truemail::VERSION,
          platform: `ruby -v`.chomp,
          version: TruemailServer::VERSION
        }.to_json
      end
    end
  end
end
