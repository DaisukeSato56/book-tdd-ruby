# frozen_string_literal: true

require './money'
require './bank'

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

  it 'returns true if amount and currency are same' do
    expect(Money.new(10, 'CHF').equals(Money.franc(10))).to be true
  end

  it '#plus' do
    five = Money.dollar(5)
    result = five.plus(five)
    sum = result
    expect(five).to eq sum.augend
    bank = Bank.new
    reduced = bank.reduce(sum, 'USD')
    expect(reduced.amount).to eq Money.dollar(10).amount
  end

  it 'reduce Sum' do
    sum = Sum.new(Money.dollar(3), Money.dollar(4))
    bank = Bank.new
    result = bank.reduce(sum, 'USD')
    expect(Money.dollar(7).amount).to eq result.amount
  end

  it 'reduce Money' do
    bank = Bank.new
    result = bank.reduce(Money.dollar(1), 'USD')
    expect(result.amount).to eq Money.dollar(1).amount
  end

  it 'reduce different currency' do
    bank = Bank.new
    bank.addRate('CHF', 'USD', 2)
    result = bank.reduce(Money.franc(2), 'USD')
    expect(result.amount).to eq Money.dollar(1).amount
  end

  it 'check array equals' do
  end

  it 'identity rate' do
    expect(Bank.new.rate('USD', 'USD')).to eq 1
  end

  it 'returns addition for multiple currency' do
    five_bucks = Money.dollar(5)
    ten_francs = Money.franc(10)
    bank = Bank.new
    bank.addRate('CHF', 'USD', 2)
    result = bank.reduce(five_bucks.plus(ten_francs), 'USD')
    expect(result.amount).to eq Money.dollar(10).amount
  end

  it '#plus for Sum' do
    five_bucks = Money.dollar(5)
    ten_francs = Money.franc(10)
    bank = Bank.new
    bank.addRate('CHF', 'USD', 2)
    sum = Sum.new(five_bucks, ten_francs).plus(five_bucks)
    result = bank.reduce(sum, 'USD')
    expect(result.amount).to eq Money.dollar(15).amount
  end
end
