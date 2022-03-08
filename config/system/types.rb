# frozen_string_literal: true

require 'dry-types'

module System
  module Types
    include Dry.Types()

    StringToRegex = Types::Constructor(::Regexp) { |param| ::Regexp.new(param[1...-1]) }
    StringToArray = Types::Array.constructor { |param| param.split(',') }
    StringToHash = Types::Hash.constructor do |param|
      param.split(',').to_h { |pair| pair.split(':') }.transform_values(&:to_sym)
    end
  end
end
