# frozen_string_literal: true

require 'simplecov'

SimpleCov.minimum_coverage(100)
SimpleCov.start { add_filter(%r{\A/spec/}) }
