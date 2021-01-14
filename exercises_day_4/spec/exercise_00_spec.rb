require_relative '../lib/exercise_00'

describe "crypto_scrapper" do
  describe "crypto_scrapper" do
    it "should return a non nil value" do
      expect(crypto_scrapper()).not_to be_nil
    end
    it "should return true" do
      expect(crypto_scrapper().length > 190).to eq(true)
    end
    it "should have some currencies" do
      currency_to_test = ["BTC", "ETH", "DASH", "LUNA"]
      result = crypto_scrapper()
      currency_to_test.each do |x|
        currency_h = result.find{|item| item.key?(x)}
        expect(currency_h).not_to be_nil
        expect(currency_h[x]).to be_a(Float)
      end
    end
    it "should not have the POTATOE currency" do
      currency_to_test = "POTATO"
      result = crypto_scrapper()
      expect(result.find{|item| item.key?(currency_to_test)}).to eq(nil)
    end
  end
  
end
