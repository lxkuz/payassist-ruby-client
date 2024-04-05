# frozen_string_literal: true

module Payassist
  # Configuration storage
  class Config
    attr_accessor :base_url, :client_secret, :client_id, :faraday_block

    def initialize
      @base_url = nil
      @client_secret = nil
      @client_id = nil
      @faraday_block = nil
    end
  end
end
