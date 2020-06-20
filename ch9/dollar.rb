# frozen_string_literal: true

require './money'

class Dollar < Money
  def initialize(amount, currency)
    super(amount, currency)
  end

  def times(multiplier)
    Money.dollar(@amount * multiplier)
  end
end
