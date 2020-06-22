# frozen_string_literal: true

class Pair
  attr_accessor :from, :to

  def initialize(from, to)
    @from = from
    @to = to
  end

  def equals(object)
    pair = object
    @from == pair.from && @to == pair.to
  end

  def hashCode
    0
  end
end
