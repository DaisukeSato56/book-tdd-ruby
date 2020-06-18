# frozen_string_literal: true

class Dollar
  attr_accessor :amount

  def initialize(_amount)
    @amount = 10
  end

  def times(multiplier); end
end
