# frozen_string_literal: true

module ControllerHelpers
  def json_object(object)
    object.to_json
  end

  def json_content_type
    TruemailServer::Controllers::Base::CONTENT_TYPE
  end
end
