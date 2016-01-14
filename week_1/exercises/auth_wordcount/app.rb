require_relative("lib/auth.rb")
require_relative("lib/wordcount.rb")

auth = Auth.new
wordcount = WordCount.new
if auth.login == true
	wordcount.get_text
	wordcount.counter
else
	puts "Please check your login details and run the program again."
end