# frozen_string_literal: true

module TruemailServer
  module Services
    class AccessToken
      def self.validate(token)
        System::Configuration.command_line_params[:access_tokens].include?(token)
      end
    end
  end
end
