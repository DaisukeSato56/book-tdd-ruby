# frozen_string_literal: true

class Money
  attr_accessor :amount, :currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def equals(object)
    money = object
    @amount == money.amount && self.class == money.class
  end

  def times
    raise 'call abstract !'
  end

  class << self
    def dollar(amount)
      Dollar.new(amount, 'USD')
    end

    def franc(amount)
      Franc.new(amount, 'CHF')
    end
  end
end
