# frozen_string_literal: true

require './money'

class Franc < Money
  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def times(multiplier)
    Money.franc(@amount * multiplier)
  end
end
