require 'rails_helper'

RSpec.describe TokenAuthentication, type: :model do

  it "reads tokens from ENV['TOKEN']" do
    token = SecureRandom.hex
    ENV['TOKENS'] = token
    expect(TokenAuthentication.tokens).to eq [token]
  end

  it "validates a correct token" do
    ENV['TOKENS'] = "a,b"
    expect(TokenAuthentication.valid?('a')).to be true
  end

  it "doesnt validate an incorrect token" do
    ENV['TOKENS'] = "a,b"
    expect(TokenAuthentication.valid?('c')).to be false
  end

end
