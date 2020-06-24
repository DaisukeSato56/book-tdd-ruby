# frozen_string_literal: true

module Expression
  def reduce(_to)
    raise 'implement abstract method !'
  end

  def plus(_addend)
    raise 'impmenet abstract method !'
  end
end
