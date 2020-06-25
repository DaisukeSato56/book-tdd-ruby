# frozen_string_literal: true

class Money
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def equals(object)
    money = object
    @amount == money.amount && self.class == money.class
  end
end
