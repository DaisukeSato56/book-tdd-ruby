# frozen_string_literal: true

require './dollar'

describe 'dollar class' do
  it 'returns multiple currency' do
    five = Dollar.new(5)
    five.times(2)
    expect(five.amount).to eq 10
  end
end
