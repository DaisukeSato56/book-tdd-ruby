# frozen_string_literal: true

require './dollar'
require './franc'

describe Dollar do
  it 'returns multiple ammount' do
    five = Dollar.new(5)
    expect(five.times(2).amount).to eq Dollar.new(10).amount
    expect(five.times(3).amount).to eq Dollar.new(15).amount
  end

  it '.equals' do
    expect(Dollar.new(5).equals(Dollar.new(5))).to be true
    expect(Dollar.new(5).equals(Dollar.new(6))).to be false
  end
end

describe Franc do
  it 'returns multiple ammount' do
    five = Franc.new(5)
    expect(five.times(2).amount).to eq Franc.new(10).amount
    expect(five.times(3).amount).to eq Franc.new(15).amount
  end

  it '.equals' do
    expect(Franc.new(5).equals(Franc.new(5))).to be true
    expect(Franc.new(5).equals(Franc.new(6))).to be false
  end
end
