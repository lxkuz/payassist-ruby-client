# frozen_string_literal: true

require "payassist/config"
require "payassist/client"

module Payassist
  # Transfer API
  class Transfer < Client
    def p2card(data)
      body = prepare_body("P2Card", data)
      send_request(path: "transfer/send-card-external", body: body)
    end

    def sbp(data)
      body = prepare_body("SBP", data)
      send_request(path: "transfer/send-sbp-external", body: body)
    end
  end
end
