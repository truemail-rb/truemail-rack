# frozen_string_literal: true

module RequestHelpers
  def app
    Rack::Builder.parse_file('config.ru').first
  end

  def response
    last_response
  end
end
