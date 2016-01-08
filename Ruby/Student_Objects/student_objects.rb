class Student
  attr_accessor :scores, :first_name

  def initialize(scores, first_name)   #Use named arguments!
  	@scores = scores
  	@first_name = first_name
    #your code here
  end

  def average
  	sum = 0
  	@scores.each { |a|
  		a = a.to_f
  	 sum += a}
  	length = @scores.length
  	average = sum / @scores.length
  	return average
  end

  def letter_grade
  	if average >= 90
  		return 'A'
  	elsif average >= 80
  		return 'B'
  	elsif average >= 70
  		return 'C'
  	elsif average >= 60
  		return 'D'
  	else
  		return 'E'
  	end		
  end
end

alex = Student.new([100,100,100,0,100], "Alex")
josh = Student.new([2,2,2,2,2], "Josh")
nizar = Student.new([3,3,3,3,3], "Nizar")
karen = Student.new([4,4,4,4,4], "Karen")
alia = Student.new([5,5,5,5,5], "Alia")

students = []
students.push(alex)
students.push(josh)
students.push(nizar)
students.push(karen)
students.push(alia)

p students[0].first_name == "Alex"
p students[0].scores.length == 5
p students[0].scores[0] == students[0].scores[4]
p students[0].scores[3] == 0

p students[0].average == 80
p students[0].letter_grade == 'B'

 def linear_search(array, value)
 	array.each_index do |index|
 		if array[index].first_name == value
 			return 0
 		else
 			return -1
 		end
 	end
 end

p linear_search(students, "Alex") == 0
p linear_search(students, "NOT A STUDENT") == -1