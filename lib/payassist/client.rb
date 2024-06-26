# frozen_string_literal: true

# Base implementation of the MTN API client

# Includes methods common to collections, disbursements and remittances

require "faraday"
require "base64"

require "payassist/config"
require "payassist/errors"

module Payassist
  # Base API client
  class Client
    def send_request(path:, headers: {}, body: {}, method: :post)
      conn = faraday_with_block(url: Payassist.config.base_url)
      conn.headers = build_headers(headers)
      case method.to_s
      when "get" then response = conn.get(path, body)
      when "post" then response = conn.post(path, body.to_json)
      end
      interpret_response(response)
    end

    def interpret_response(resp)
      body = resp.body.empty? ? "" : JSON.parse(resp.body)
      response = {
        body: body,
        code: resp.status
      }
      handle_error(response[:body], response[:code]) unless resp.status >= 200 && resp.status < 300
      body
    end

    def handle_error(response_body, response_code)
      raise Payassist::Error.new(response_body, response_code)
    end

    private

    def prepare_body(tx_name, data)
      {
        "header" => {
          "txName" => tx_name
        },
        "reqData" => data
      }
    end

    def build_headers(headers)
      {
        "Authorization" => "Basic #{build_api_token}",
        "Content-Type" => "application/json"
      }.merge(headers)
    end

    def faraday_with_block(options)
      Faraday.new(options)
      block = Payassist.config.faraday_block
      if block
        Faraday.new(options, &block)
      else
        Faraday.new(options)
      end
    end

    def build_api_token
      str = "#{Payassist.config.client_id}:#{Payassist.config.client_secret}"
      Base64.encode64(str).gsub(/\n/, "")
    end
  end
end
