require "ruby-dictionary"
class Words
	attr_reader :firstword, :lastword
	def initialize (firstword , lastword)
		@dictionary = Dictionary.from_file('words')
		@firstword = firstword
		@lastword = lastword
		@current_index = 0
		@current_index_of = 0
	end
	def solvers
		@word1 = @firstword.split("")
		@word2 = @lastword.split("")
		correct
		puts "word1 = #{@word1.join} and word 2 also equals #{@word2.join}"
	end

	def correct
		@last = @word1[@current_index]
		@word1[@current_index] = @word2[@current_index_of]
		@word = @word1.join

		if @dictionary.exists?(@word) != true
			wrong
		end

		if @word1 != @word2
			@current_index += 1
			@current_index_of +=1
			if @current_index >= @word1.length
				@current_index_of = 0
				@current_index = 0
			end
			p @word1.join
			correct
		else
			puts @word1.join
		end
	end

	def wrong
		@word1[@current_index] = @last
	end
end