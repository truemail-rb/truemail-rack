# frozen_string_literal: true

require_relative 'config/loader'

use Rack::Reloader, 0
run TruemailServer::Application
