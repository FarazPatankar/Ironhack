class Student
  attr_accessor :scores, :first_name, :ssn

  def initialize(scores, first_name, ssn)   #Use named arguments!
  	@scores = scores
  	@first_name = first_name
  	@ssn = ssn
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

alex = Student.new([100,100,100,0,100], "Alex", "111-11-1111")
josh = Student.new([2,2,2,2,2], "Josh", "001-00-0000")
nizar = Student.new([3,3,3,3,3], "Nizar", "100-00-0000")
karen = Student.new([4,4,4,4,4], "Karen", "222-22-2222")
alia = Student.new([5,5,5,5,5], "Alia", "333-33-3333")

students = []
students.push(alex)
students.push(josh)
students.push(nizar)
students.push(karen)
students.push(alia)


def linear_search(array, value)
	array.each_index do |index|
		if array[index].first_name == value
			return 0
		else
			return -1
		end
	end
end

def sort(array)
	array.sort_by! {|x| x.ssn}
end

def binary_search(array,value)
    index = array.index do |x|
        x.ssn == value
    end
    
    if index == nil
        -1
    else
        index
    end
end

p binary_search(students, "111-11-1111") == 0
p binary_search(students, "000-00-0000") == -1

sort(students)

p students[0].ssn < students[1].ssn
p students[3].ssn > students[0].ssn