# frozen_string_literal: true

require './money'

class Franc < Money
  def times(multiplier)
    Franc.new(@amount * multiplier)
  end
end
