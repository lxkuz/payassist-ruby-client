# frozen_string_literal: true

require "payassist/config"
require "payassist/client"

module Payassist
  # Invoice API
  class BillPayment < Client
    def create_invoice(data)
      body = prepare_body('CreateBillInvoice', data)
      send_request(path: 'bill-payment/invoice/create', body: body)
    end

    def create_invoice_host2host(data)
      body = prepare_body('CreateBillInvoiceHost2Host', data)
      send_request(path: 'bill-payment/invoice-host2host/create', body: body)
    end

    def rate_p2p
      body = prepare_body('PayRateExchange', data)
      send_request(path: 'bill-payment/rate_p2p', body: body)
    end
  end
end
