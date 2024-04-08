# frozen_string_literal: true

require "spec_helper"
require "pry"

RSpec.describe Payassist::BillPayment do
  before do
    Payassist.configure do |config|
      config.base_url = "https://api.payassist.io/p2p"
      config.client_id = "lj8NGi7xt5UgJx1J"
      config.client_secret = "EbsiNBLw5A8Dq0ipveafiGGgCZb9UY"
    end
  end

  let(:bill_payment) { described_class.new }

  describe "#create_invoice_host2host" do
    subject(:result) { bill_payment.create_invoice_host2host(data) }

    let(:data) do
      {
        "amount" => 300,
        "address" => "0817",
        "platform" => "CARD",
        "currency" => "RUB",
        "ip" => "135.181.xx.xx",
        "client" => "89221111111",
        "recipient" => "user1",
        "c_from" => "TCSBRUB",
        "c_to" => "CARDRUB",
        "date" => "2024-04-05T19:40:19",
        "txn" => "2c9c407b-5576-43ba-b771-8890dc6a4e16",
        "user_agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36",
        "email" => "test@gmail.com",
        "cid" => "2c9c407b-5576-43ba-b771-8890dc6a4e17",
        "paySource" => "card"
      }
    end

    let(:response_data) do
      {
        "errors" => nil,
        "header" => {
          "androidVersion" => 1, "iosVersion" => "1.0", "lang" => "EN", "traceId" => "0a347dd63b3a2b90", "txName" => "CreateBillInvoiceHost2Host", "version" => "0.1"
        },
        "responseData" => {
          "_id" => "8bae0582-eac7-4da9-ab14-fccd37e20f71", "amount" => 300, "bankName" => "Sberbank", "cAmount" => 300, "cType" => "RUB", "currency" => "RUB", "expiredTime" => "2024-04-05T13:10:21Z", "holderName" => "Test Holder Name", "message" => "Customer order has been registered, kindly share below details with them.", "paymentNumber" => "4242424242424242", "rate" => 1
        },
        "result" => { "message" => "Request completed successfully", "status" => true }
      }
    end

    context "when transaction is valid", vcr: "bill_payment/create_invoice_host2host" do
      it "responds with payment credentials" do
        expect(result).to eq(response_data)
      end
    end
  end

  describe "#create_invoice" do
    subject(:result) { bill_payment.create_invoice(data) }

    let(:data) do
      {
        "amount" => 300,
        "address" => "0817",
        "platform" => "CARD",
        "currency" => "RUB",
        "ip" => "135.181.xx.xx",
        "client" => "89221111111",
        "recipient" => "user1",
        "c_from" => "TCSBRUB",
        "c_to" => "CARDRUB",
        "date" => "2024-04-05T19:40:19",
        "txn" => "2c9c407b-5576-43ba-b771-8890dc6a4e26",
        "user_agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36",
        "email" => "test@gmail.com",
        "cid" => "2c9c407b-5576-43ba-b771-8890dc6a4e27",
        "paySource" => "card"
      }
    end

    let(:response_data) do
      {
        "errors" => nil,
        "header" => {
          "androidVersion" => 1,
          "iosVersion" => "1.0",
          "lang" => "EN",
          "traceId" => "b21174f0d0798447",
          "txName" => "CreateBillInvoice",
          "version" => "0.1"
        },
        "responseData" => {
          "_id" => "67bba050-d624-4f1e-aac2-2a4916d9755c",
          "amount" => 300,
          "cAmount" => 300,
          "cType" => "RUB",
          "currency" => "RUB",
          "expiredTime" => "2024-04-05T13:29:05Z",
          "message" => "Customer order has been registered, kindly share below details with them.",
          "paymentLink" => "https://api.step4pay.com/FE/rest/tx/c2c/purchase/execute?txId=9d4fba2f-82db-4ae3-9864-7eaacf6591d9",
          "rate" => 1
        },
        "result" => { "message" => "Request completed successfully", "status" => true }
      }
    end

    context "when transaction is valid", vcr: "bill_payment/create_invoice" do
      it "responds with payment credentials" do
        expect(result).to eq(response_data)
      end
    end
  end

  describe "#rate_p2p" do
    subject(:result) { bill_payment.rate_p2p }

    let(:response_data) do
      {
        "errors" => nil,
        "header" => { "androidVersion" => 1, "iosVersion" => "1.0", "lang" => "EN", "traceId" => "d825ee0f7614fccd",
                      "txName" => "", "version" => "0.1" },
        "responseData" => { "currencyFrom" => "RUB", "currencyTo" => "USDT", "rate" => 97.1 },
        "result" => { "message" => "Request completed successfully", "status" => true }
      }
    end

    context "when transaction is valid", vcr: "bill_payment/rate_p2p" do
      it "responds p2p rate" do
        expect(result).to eq(response_data)
      end
    end
  end
end
