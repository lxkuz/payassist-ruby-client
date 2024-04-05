# frozen_string_literal: true

require "payassist/config"
require "payassist/client"

module Payassist
  # Get site balance API
  class Balance < Client
    def get(data)
      path = 'accounts/fetch-balance'
      body = {
        "header" => {
          "txName" =>"accountsBalance"
        },
        "reqData" => data
      }
      send_request(method: :post, path: path, body: body)
    end
  end
end
