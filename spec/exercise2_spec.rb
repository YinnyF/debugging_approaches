# Intended output:
#
# > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
#
# > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"
require 'exercise2'

describe 'encoder' do
  it 'encodes the string correctly' do
    expect(encode("theswiftfoxjumpedoverthelazydog", "secretkey")).to eq "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
  end
end

describe 'decoder' do
  it 'decodes the string correctly' do
    expect(decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")).to eq "theswiftfoxjumpedoverthelazydog"
  end
end