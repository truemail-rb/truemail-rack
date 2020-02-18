# frozen_string_literal: true

module TruemailServer
  module Services
    class EmailValidator
      def self.call(email)
        Truemail.validate(email).as_json
      end
    end
  end
end
