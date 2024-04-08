# frozen_string_literal: true

require "payassist/config"
require "payassist/client"

module Payassist
  # Get transactions data API
  class Transaction < Client
    def list(data)
      body = prepare_body("fetchMerchTx", data)
      send_request(path: "transfer/get-merchant-tx", body: body)
    end

    def get(data)
      body = prepare_body("fetchOrderInfo", data)
      send_request(path: "transfer/get-order-info", body: body)
    end
  end
end
