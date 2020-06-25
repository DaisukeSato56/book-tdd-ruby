# frozen_string_literal: true

require './dollar'
require './franc'

describe Money do
  it 'returns multiple ammount' do
    five = Money.dollar(5)
    expect(five.times(2).amount).to eq Money.dollar(10).amount
    expect(five.times(3).amount).to eq Money.dollar(15).amount
  end

  it '.equals' do
    expect(Money.dollar(5).equals(Money.dollar(5))).to be true
    expect(Money.dollar(5).equals(Money.dollar(6))).to be false
    expect(Money.dollar(5).equals(Money.franc(5))).to be false
  end

  it '#currency' do
    expect(Money.dollar(1).currency).to eq 'USD'
    expect(Money.franc(1).currency).to eq 'CHF'
  end
end
