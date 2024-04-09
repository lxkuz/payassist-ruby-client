# frozen_string_literal: true

require "payassist/config"
require "payassist/client"

module Payassist
  # Get Banks API
  class Bank < Client
    def all
      body = prepare_body("BanksAll", {})
      send_request(path: "bank/all", body: body, method: :get)
    end

    def by_phone(number)
      body = prepare_body("BanksAllByNumber", {})
      send_request(path: "bank/#{number}", body: body, method: :get)
    end
  end
end
