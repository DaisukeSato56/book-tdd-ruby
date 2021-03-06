# frozen_string_literal: true

require './expression'
require './money'

class Sum
  include Expression
  attr_accessor :augend, :addend

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def reduce(_bank, to)
    amount = @augend.amount + @addend.amount
    Money.new(amount, to)
  end
end
