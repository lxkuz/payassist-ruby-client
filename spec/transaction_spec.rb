# frozen_string_literal: true

require "spec_helper"
require "pry"

RSpec.describe Payassist::Transaction do
  before do
    Payassist.configure do |config|
      config.base_url = "https://api.payassist.io/p2p"
      config.client_id = 'lj8NGi7xt5UgJx1J'
      config.client_secret = 'EbsiNBLw5A8Dq0ipveafiGGgCZb9UY'
    end
  end

  let(:transaction) { described_class.new }

  describe "#list" do
    subject(:result) { transaction.list(request_data) }


    let(:request_data) do
      {
        start: 0,
        limit: 2,
        currency: ['RUB'],
        provider: ['CARD'],
      }
    end

    let(:transactions_data) do
      {
        "errors" => nil,
        "header" => {"androidVersion"=>1, "iosVersion"=>"1.0", "lang"=>"EN", "traceId"=>"f66dbde21dbbe7bd", "txName"=>"fetchMerchTx", "version"=>"0.1"},
        "responseData" => {
          "total"=>11,
          "transactions"=>[
            {
              "_id"=>"b181abdb-4ffc-404b-9a27-842e59a762dc",
              "amount"=>"1001.00000000",
              "cAmount"=>0.0,
              "cType"=>"RUB",
              "commission"=>"0.00",
              "crypto_amount"=>nil,
              "crypto_tx_ids"=>nil,
              "ctime"=>"2024-04-08T10:57:19.21416+03:00[Europe/Moscow]",
              "currency"=>"RUB",
              "dest_address"=>"4242424242424242",
              "dest_user"=>nil,
              "expiredTime"=>nil,
              "extra_id"=>nil,
              "extra_info"=>nil,
              "final_pay_source"=>"unknown",
              "note"=>nil,
              "protocol_type"=>"CARD",
              "provider"=>"CARD",
              "rate"=>1,
              "real_status"=>"FAILED",
              "receiptCode"=>nil,
              "ref_id"=>"b181abdb-4ffc-404b-9a27-842e59a762dc",
              "request_id"=>"2c9c407b-5576-43ba-b771-8890dc6a4e32",
              "source_address"=>"2c9c407b-5576-43ba-b771-8890dc6a4127",
              "src_user"=>"b3190ba6-7ff9-4caf-be08-bc546cab05cd",
              "tail"=>nil,
              "tx"=>[{"address"=>nil,
                "amount"=>1001.0,
                "balance"=>nil,
                "ctime"=>nil,
                "fee_amount"=>0,
                "mtime"=>nil,
                "order_id"=>"b181abdb-4ffc-404b-9a27-842e59a762dc",
                "ref_id"=>nil,
                "removed"=>0,
                "tariff_charge"=>0,
                "tx_type"=>"CREDIT"}],
              "tx_direction"=>"WITHDRAW",
              "tx_status"=>"FAILED",
              "tx_type"=>"MERCHANT-EXTERNAL",
              "update_time"=>"2024-04-08T10:57:19.77479+03:00[Europe/Moscow]"
            },
            {
              "_id"=>"aa3c873e-2067-44ef-ba01-2c1ac50f1de7",
              "amount"=>"1001.00000000",
              "cAmount"=>0.0,
              "cType"=>"RUB",
              "commission"=>"0.00",
              "crypto_amount"=>nil,
              "crypto_tx_ids"=>nil,
              "ctime"=>"2024-04-08T10:24:25.645638+03:00[Europe/Moscow]",
              "currency"=>"RUB",
              "dest_address"=>"4242424242424242",
              "dest_user"=>nil,
              "expiredTime"=>nil,
              "extra_id"=>nil,
              "extra_info"=>nil,
              "final_pay_source"=>"unknown",
              "note"=>nil,
              "protocol_type"=>"CARD",
              "provider"=>"CARD",
              "rate"=>1,
              "real_status"=>"FAILED",
              "receiptCode"=>nil,
              "ref_id"=>"aa3c873e-2067-44ef-ba01-2c1ac50f1de7",
              "request_id"=>"2c9c407b-5576-43ba-b771-8890dc6a4e31",
              "source_address"=>"2c9c407b-5576-43ba-b771-8890dc6a4127",
              "src_user"=>"b3190ba6-7ff9-4caf-be08-bc546cab05cd",
              "tail"=>nil,
              "tx"=>[{"address"=>nil,
              "amount"=>1001.0,
              "balance"=>nil,
              "ctime"=>nil,
              "fee_amount"=>0,
              "mtime"=>nil,
              "order_id"=>"aa3c873e-2067-44ef-ba01-2c1ac50f1de7",
              "ref_id"=>nil,
              "removed"=>0,
              "tariff_charge"=>0,
              "tx_type"=>"CREDIT"}],
            "tx_direction"=>"WITHDRAW",
            "tx_status"=>"FAILED",
            "tx_type"=>"MERCHANT-EXTERNAL",
            "update_time"=>"2024-04-08T10:24:26.305837+03:00[Europe/Moscow]"
          }
        ]},
        "result" => {"message"=>"Request completed successfully",
          "status"=>true},
      }
    end

    context "when transaction is valid", vcr: "transaction/list" do
      it "returns all transactions" do
        expect(result).to eq(transactions_data)
      end
    end
  end

  describe "#get" do
    subject(:result) { transaction.get(request_data) }


    let(:request_data) do
      {
        request_id: '2c9c407b-5576-43ba-b771-8890dc6a4e32'
      }
    end

    let(:transaction_data) do
      {
        "errors" => nil,
        "header" => {"androidVersion"=>1, "iosVersion"=>"1.0", "lang"=>"EN", "traceId"=>"c43f99e0e1ba64b1", "txName"=>"fetchOrderInfo", "version"=>"0.1"},
        "responseData" => {"total"=>1, "transactions"=>[{"_id"=>"b181abdb-4ffc-404b-9a27-842e59a762dc", "amount"=>"1001.00000000", "cAmount"=>0.0, "cType"=>"RUB", "commission"=>"0.00", "crypto_amount"=>nil, "crypto_tx_ids"=>nil, "ctime"=>"2024-04-08T10:57:19.21416+03:00[Europe/Moscow]", "currency"=>"RUB", "dest_address"=>"4242424242424242", "dest_user"=>nil, "expiredTime"=>nil, "extra_id"=>nil, "extra_info"=>nil, "final_pay_source"=>"unknown", "note"=>nil, "protocol_type"=>"CARD", "provider"=>"CARD", "rate"=>1, "real_status"=>"FAILED", "receiptCode"=>nil, "ref_id"=>"b181abdb-4ffc-404b-9a27-842e59a762dc", "request_id"=>"2c9c407b-5576-43ba-b771-8890dc6a4e32", "source_address"=>"2c9c407b-5576-43ba-b771-8890dc6a4127", "src_user"=>"b3190ba6-7ff9-4caf-be08-bc546cab05cd", "tail"=>nil, "tx"=>[{"address"=>nil, "amount"=>1001.0, "balance"=>nil, "ctime"=>nil, "fee_amount"=>0, "mtime"=>nil, "order_id"=>"b181abdb-4ffc-404b-9a27-842e59a762dc", "ref_id"=>nil, "removed"=>0, "tariff_charge"=>0, "tx_type"=>"CREDIT"}], "tx_direction"=>"WITHDRAW", "tx_status"=>"FAILED", "tx_type"=>"MERCHANT-EXTERNAL", "update_time"=>"2024-04-08T10:57:19.77479+03:00[Europe/Moscow]"}]},
        "result" => {"message"=>"Request completed successfully", "request_id"=>"2c9c407b-5576-43ba-b771-8890dc6a4e32", "status"=>true},
      }
    end

    context "when request is valid", vcr: "transaction/get" do
      it "returns transaction data" do
        expect(result).to eq(transaction_data)
      end
    end
  end
end
