require_relative("../lib/lexiconomitron.rb")

RSpec.describe Lexiconomitron do
  describe "#eat_t" do
  	before :each do
  		@lexi = Lexiconomitron.new
  	end
    it "removes every letter t from the input" do
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end

    it "reverses and removes t from the input" do
    	expect(@lexi.shazam(["This", "is", "a", "boring", "test"])).to eq(["sih", "se"])
  	end

  	it "takes all words with less than 4 characters and removes t from the input" do
  		expect(@lexi.oompa_loompa(["if", "you", "wanna", "be", "my", "lover"])).to eq(["if", "you", "be", "my"])
  		expect(@lexi.oompa_loompa(['I', "love", "tea"])).to eq(["I", "ea"])
  	end
  end
end