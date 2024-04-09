# frozen_string_literal: true

require "payassist/config"
require "payassist/version"

require "payassist/balance"
require "payassist/bank"
# require "payassist/transfer"
require "payassist/bill_payment"
require "payassist/transaction"

# Head module
module Payassist
  class << self
    attr_accessor :config
  end

  def self.config
    @config ||= Config.new
  end

  def self.reset
    @config = Config.new
  end

  def self.configure
    yield(config)
  end
end
