# frozen_string_literal: true

require "spec_helper"
require "pry"

RSpec.describe Payassist::Transfer do
  before do
    Payassist.configure do |config|
      config.base_url = "https://api.payassist.io/p2p"
      config.client_id = "lj8NGi7xt5UgJx1J"
      config.client_secret = "EbsiNBLw5A8Dq0ipveafiGGgCZb9UY"
    end
  end

  let(:transfer) { described_class.new }

  describe "#p2card" do
    subject(:result) { transfer.p2card(data) }

    let(:data) do
      {
        "user_id" => "user1",
        "amount" => 5001,
        "platform" => "CARD",
        "currency" => "RUB",
        "request_id" => "2c9c407b-5576-43ba-b771-8890dc6a4432",
        "ip" => "135.181.253.82",
        "recipient" => "4242424242424242",
        "c_from" => "CARDRUB",
        "c_to" => "SBERRUB",
        "txn" => "2c9c407b-5576-43ba-b771-8890dc6a4e27",
        "user_agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) " \
                        "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36",
        "email" => "m2lxkuz@gmail.com",
        "cid" => "2c9c407b-5576-43ba-b771-8890dc6a4227",
        "date" => "2024-04-09T17:13:14",
        "client" => "2c9c407b-5576-43ba-b771-8890dc6a4127"
      }
    end

    let(:response_data) do
      {
        "errors" => nil,
        "header" => { "androidVersion" => 1,
                      "iosVersion" => "1.0",
                      "lang" => "EN", "traceId" => "9974a5503f643390",
                      "txName" => "P2Card", "version" => "0.1" },
        "responseData" => {
          "_id" => "cec4a82a-acd6-4e44-8fae-36352fecc2e4",
          "amount" => 5001,
          "currency" => "RUB",
          "extra_id" => "",
          "original_amount" => 5001,
          "ref_id" => "0eeb478a-c1df-4ac6-9a9e-ff2d298bee45",
          "request_id" => "2c9c407b-5576-43ba-b771-8890dc6a4432", "status" => "APPROVED"
        },
        "result" => { "message" => "Request completed successfully",
                      "request_id" => "2c9c407b-5576-43ba-b771-8890dc6a4432", "status" => true }
      }
    end

    context "when transaction is valid", vcr: "transfer/p2card" do
      it "responds with payment credentials" do
        expect(result).to eq(response_data)
      end
    end
  end

  describe "#sbp" do
    subject(:result) { transfer.sbp(data) }

    let(:data) do
      {
        "user_id" => "user1",
        "amount" => 5001,
        "platform" => "CARD",
        "currency" => "RUB",
        "request_id" => "2c9c407b-5576-43ba-b771-8892dc6a4432",
        "ip" => "135.181.253.82",
        "recipient" => "89221111111",
        "bankId" => "100000000004",
        "c_from" => "CARDRUB",
        "c_to" => "CARDRUB",
        "txn" => "2c9c407b-5576-43ba-b771-8890dc6a4e37",
        "user_agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) " \
                        "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36",
        "email" => "m2lxkuz@gmail.com",
        "cid" => "2c9c407b-5576-43ba-b771-8890dc6a4227",
        "date" => "2024-04-09T17:13:14",
        "client" => "89221111111"
      }
    end

    let(:response_data) do
      {
        "errors" => nil,
        "header" => { "androidVersion" => 1, "iosVersion" => "1.0", "lang" => "EN", "traceId" => "169726ad24aa3e64",
                      "txName" => "SBP", "version" => "0.1" },
        "responseData" => { "_id" => "4803d6a5-df69-4125-af66-6de2de39b0f6",
                            "amount" => 5001,
                            "currency" => "RUB",
                            "extra_id" => "",
                            "original_amount" => 5001,
                            "ref_id" => "ad518622-ef49-45b6-97c1-04ded79f75e8",
                            "request_id" => "2c9c407b-5576-43ba-b771-8892dc6a4432",
                            "status" => "APPROVED" },
        "result" => { "message" => "Request completed successfully",
                      "request_id" => "2c9c407b-5576-43ba-b771-8892dc6a4432",
                      "status" => true }
      }
    end

    context "when transaction is valid", vcr: "transfer/sbp" do
      it "responds with payment credentials" do
        expect(result).to eq(response_data)
      end
    end
  end
end
