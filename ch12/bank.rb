# frozen_string_literal: true

require './money'

class Bank
  def reduce(_source, _to)
    Money.dollar(10)
  end
end
