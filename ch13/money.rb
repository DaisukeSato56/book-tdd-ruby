# frozen_string_literal: true

require './expression'
require './sum'

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

  def reduce(_to)
    self
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
