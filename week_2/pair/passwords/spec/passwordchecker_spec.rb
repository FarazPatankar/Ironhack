

require_relative("../lib/passwordchecker.rb")


RSpec.describe PasswordChecker do
	before :each do
		@passwordchecker = PasswordChecker.new
	end	

	describe "#check_length" do
		it "checks if password length is more than 7 characters" do
			expect(@passwordchecker.check_length("123456")).to be false
			expect(@passwordchecker.check_length("12345678")).to be true
		end
	end

	describe "#check_chars" do
		it "checks if password contains at least one letter, one number and one symbol" do
			expect(@passwordchecker.check_chars("asdf")).to be false
			expect(@passwordchecker.check_chars("123456")).to be false
			expect(@passwordchecker.check_chars("%^&")).to be false
			expect(@passwordchecker.check_chars("adfasd12334")).to be false
			expect(@passwordchecker.check_chars("asadfadsf%$%^")).to be false
			expect(@passwordchecker.check_chars("345@$")).to be false
			expect(@passwordchecker.check_chars("aaa111!!!")).to be true
		end
	end

	describe "#check_case" do
		it "checks if password contains at least one uppercase and one lowercase letter" do
			expect(@passwordchecker.check_case("asdf")).to be false
			expect(@passwordchecker.check_case("ASDF")).to be false
			expect(@passwordchecker.check_case("asdASDF")).to be true
		end
	end

	describe "#check_contain" do
		it "checks if password contains either name or domain" do
			expect(@passwordchecker.check_contain("javi@garcia.com", "javiasdf")).to be false
			expect(@passwordchecker.check_contain("javi@garcia.com", "ASDgarciaF")).to be false
			expect(@passwordchecker.check_contain("javi@garcia.com", "asdf")).to be true
		end
	end		
end