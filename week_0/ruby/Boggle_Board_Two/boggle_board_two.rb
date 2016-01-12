#end
class BoggleBoard
	attr_accessor :array_of_dices
	def initialize
		@array_of_dices = []
	end

	def push_to_board
		@array_of_dices.push("AAEEGN")
		@array_of_dices.push("ELRTTY")
		@array_of_dices.push("AOOTTW")
		@array_of_dices.push("ABBJOO")
		@array_of_dices.push("EHRTVW")
		@array_of_dices.push("EHRTVW")
		@array_of_dices.push("CIMOTU")
		@array_of_dices.push("DISTTY")
		@array_of_dices.push("EIOSST")
		@array_of_dices.push("DELRVY")
		@array_of_dices.push("ACHOPS")
		@array_of_dices.push("HIMNQU")
		@array_of_dices.push("EEINSU")
		@array_of_dices.push("EEGHNW")
		@array_of_dices.push("AFFKPS")
		@array_of_dices.push("HLNNRZ")
		@array_of_dices.push("DEILRX")
	end

	def shake!
	    single_letter_strings = ''
		@array_of_dices.each do |x|
			x = x.split(//)
			single_letter_strings << x.sample
		end
		four_letter_arrays = single_letter_strings.scan(/..../)
		row_one = four_letter_arrays[0]
		row_two = four_letter_arrays[1]
		row_three = four_letter_arrays[2]
		row_four = four_letter_arrays[3]
		row_one.gsub!(/(.{1})/, '\1 ')
		row_two.gsub!(/(.{1})/, '\1 ')
		row_three.gsub!(/(.{1})/, '\1 ')
		row_four.gsub!(/(.{1})/, '\1 ')
		if row_one.include? "Q"
		    row_one.sub!("Q", "Qu")
		elsif
			row_two.include? "Q"
			row_two.sub!("Q", "Qu")
		elsif
			row_three.include? "Q"
			row_three.sub!("Q", "Qu")
		elsif
			row_four.include? "Q"
			row_four.sub!("Q", "Qu")
		end
		puts row_one
		puts row_two
		puts row_three
		puts row_four
	end
	
	
end

board = BoggleBoard.new
board.push_to_board
board.shake!