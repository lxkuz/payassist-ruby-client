# frozen_string_literal: true

require "payassist/config"
require "payassist/client"

module Payassist
  # Get balance API
  class Balance < Client
    def get(data)
      body = prepare_body("accountsBalance", data)
      send_request(path: "accounts/fetch-balance", body: body)
    end
  end
end
