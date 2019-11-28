# frozen_string_literal: true

require 'dry-types'

module System
  module Types
    include Dry.Types()

    StringToRegex = Types::Constructor(Regexp) { |param| Regexp.new(param[1...-1]) }
    StringToArray = Types::Array.constructor { |param| param.split(',') }
    StringToHash = Types::Hash.constructor do |param|
      param.split(',').map { |pair| pair.split(':') }.to_h.transform_values(&:to_sym)
    end
  end
end
