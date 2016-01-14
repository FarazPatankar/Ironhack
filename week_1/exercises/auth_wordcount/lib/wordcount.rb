class WordCount
	attr_reader :text
	def initialize
		@text = text
	end

	def get_text
		puts "Please enter some text to count words:"
		@text = gets.chomp
	end

	def counter
		length = @text.split.size
		puts "The entered text has #{length} words."
	end
end