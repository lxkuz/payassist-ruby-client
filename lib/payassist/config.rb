# frozen_string_literal: true

module Payassist
  # Configuration storage
  class Config
    attr_accessor :base_url, :api_token, :faraday_block

    def initialize
      @base_url = nil
      @api_token = nil
      @faraday_block = nil
    end
  end
end
