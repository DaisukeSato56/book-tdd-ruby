# frozen_string_literal: true

class Money
  attr_accessor :amount, :currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def equals(object)
    money = object
    @amount == money.amount && currency == money.currency
  end

  def times(multiplier)
    Money.new(@amount * multiplier, @currency)
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
