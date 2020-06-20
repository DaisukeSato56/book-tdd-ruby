# frozen_string_literal: true

require './money'

module Expression
  def reduce(_to)
    raise 'implement abstract method !'
  end
end
