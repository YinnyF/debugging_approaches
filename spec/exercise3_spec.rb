# Intended output:
#
# > factorial(5)
# => 120
require 'exercise3'

describe 'factorial' do
  it 'factorials the number correctly' do
    expect(factorial(5)).to eq 120
  end
end