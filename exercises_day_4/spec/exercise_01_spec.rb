require_relative '../lib/exercise_01'

describe "mairie-christmas" do
  
  page_mairies = 'https://www.annuaire-des-mairies.com/val-d-oise.html'
  
  describe "get_townhall_urls" do
    it "should no return nil" do
      expect(get_townhall_urls(page_mairies)).not_to be_nil
    end
    it "should equal 185" do
      expect(get_townhall_urls(page_mairies).length).to eq(185)
    end
  end
  
  describe "get_townhall_names" do
    it "should no return nil" do
      expect(get_townhall_names(page_mairies)).not_to be_nil
    end
    it "should equal 185" do
      expect(get_townhall_names(page_mairies).length).to eq(185)
    end
  end
  
  describe "get_townhalls_emails" do
    it "should no return nil" do
      expect(get_townhalls_emails().length).not_to be_nil
    end
    it "should equal 185" do
      expect(get_townhalls_emails().length).to eq(185)
    end
    it "should have some cities" do
      cities_to_test = ["HERBLAY", "US", "EAUBONNE", "CHARS"]
      cities_to_test.each do |x|
        cities_h = get_townhalls_emails().find{|item| item.key?(x)}
        expect(cities_h).not_to be_nil
        expect(cities_h[x]).to be_a(String)
      end
    end
    it "should not contain the city of CLAMART" do
      expect(get_townhalls_emails().find{|item| item.key?("CLAMART")}).to eq(nil)
    end
  end
end