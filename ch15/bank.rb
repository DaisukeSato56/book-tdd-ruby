# frozen_string_literal: true

require './money'
require './sum'
require './pair'

class Bank
  attr_accessor :rates

  def initialize
    @rates = {}
  end

  def reduce(source, to)
    source.reduce(self, to)
  end

  def addRate(from, to, rate)
    rates[Pair.new(from, to).hashCode] = rate
  end

  def rate(from, to)
    return 1 if from == to

    @rates[Pair.new(from, to).hashCode]
  end
end
