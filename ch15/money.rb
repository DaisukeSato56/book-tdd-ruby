# frozen_string_literal: true

require './expression'
require './sum'
require './pair'

class Money
  include Expression

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

  def plus(addend)
    Sum.new(self, addend)
  end

  def reduce(bank, to)
    rate = bank.rate(@currency, to)
    Money.new(@amount / rate, to)
  end

  class << self
    def dollar(amount)
      Money.new(amount, 'USD')
    end

    def franc(amount)
      Money.new(amount, 'CHF')
    end
  end
end
