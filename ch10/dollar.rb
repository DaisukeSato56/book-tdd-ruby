# frozen_string_literal: true

require './money'

class Dollar < Money
  def initialize(amount, currency)
    super(amount, currency)
  end
end
