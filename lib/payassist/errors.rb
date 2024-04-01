# frozen_string_literal: true

# Error handling for unsuccessful responses from the Payassist API

module Payassist
  # Standard API error
  class Error < StandardError
    attr_reader :code, :data

    def initialize(message, code)
      @code = code
      @data = message
      super("Error code #{code} #{message}")
    end
  end

  # Validation error
  class ValidationError < StandardError
    def initialize(msg = message)
      super(msg)
    end
  end
end
