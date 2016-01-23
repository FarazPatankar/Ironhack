class Question
	attr_reader :answer, :questions, :random_question
	def initialize(answer)
		@question = question
		@answer = answer
		@questions = []
	end

	def add_question(question)
		@questions.push(question)
	end

	def random_question
		@random_question = @questions.sample
		@random_question
	end
end