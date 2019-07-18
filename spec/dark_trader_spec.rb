require_relative '../lib/dark_trader'

describe "the crypto_scrapper method" do
  it "should return array of at lesat 3 crypto" do
    expect(crypto_scrapper(page)).not_to be_nil
  end
end