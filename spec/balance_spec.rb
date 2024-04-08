# frozen_string_literal: true

require "spec_helper"
require "pry"

RSpec.describe Payassist::Balance do
  before do
    Payassist.configure do |config|
      config.base_url = "https://api.payassist.io/p2p"
      config.client_id = "lj8NGi7xt5UgJx1J"
      config.client_secret = "EbsiNBLw5A8Dq0ipveafiGGgCZb9UY"
    end
  end

  let(:balance) { described_class.new }

  describe "#get" do
    subject(:result) { balance.get(data) }

    let(:data) do
      {
        "provider" => ["CARD"],
        "currency" => ["RUB"]
      }
    end

    let(:balance_data) do
      {
        "errors" => nil,
        "header" => {
          "androidVersion" => 1,
          "iosVersion" => "1.0",
          "lang" => "EN",
          "traceId" => "fb22bae0ee9d929c",
          "txName" => "accountsBalance",
          "version" => "0.1"
        },
        "responseData" => {
          "accounts" => [
            {
              "address" => "CARD_RUB",
              "currency" => "RUB",
              "deposit" => true,
              "minWithdraw" => 1000.0,
              "provider" => "CARD",
              "revenue" => nil,
              "sum" => 1000.0,
              "withdraw" => true
            }
          ],
          "user_id" => "b3190ba6-7ff9-4caf-be08-bc546cab05cd"
        },
        "result" => {
          "message" => "Request completed successfully", "status" => true
        }
      }
    end

    context "when transaction is valid", vcr: "balance/get" do
      it "returns site balance" do
        expect(result).to eq(balance_data)
      end
    end
  end
end
