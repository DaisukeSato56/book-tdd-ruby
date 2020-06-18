require './dollar'

describe 'Dollar class' do
  it 'returns multiple ammount' do
    five = Dollar.new(5)
    five.times(2)
    expect(five.amount).to eq 10
  end
end