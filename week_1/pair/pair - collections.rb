
class ProgrammingLanguage
  attr_accessor :name, :age, :type
  def initialize(name, age, type)
    @name = name
    @age = age
    @type = type
  end

end

  ruby = ProgrammingLanguage.new("Ruby", 21, "Dynamic")
  python = ProgrammingLanguage.new("Python", 24, "Dynamic")
  javascript = ProgrammingLanguage.new("JavaScript", 20, "Dynamic")
  go = ProgrammingLanguage.new("Go", 6, "Static")
  rust = ProgrammingLanguage.new("Rust", 5, "Static")
  swift = ProgrammingLanguage.new("Swift", 2, "Static")
  java = ProgrammingLanguage.new("Java", 20, "Static")

  array_of_languages = [ruby, python, javascript, go, rust, swift, java]

 	def array_printer(array)
	  	array.each do | language |
	    puts "Language: #{language.name} |  Age: #{language.age} |  Type System: #{language.type}"
	  	end
	end 

  array_printer(array_of_languages)

	aged_languages = array_of_languages.map do | language |
	#Your code goes here
	   language.age += 1

	   language


	end 
	puts "The programming languages aged one year are:  "
	array_printer(aged_languages)

	puts "-------------------------------------"

	sorted_languages = aged_languages.sort_by do | language |
		-language.age 
	end

	aged_languages

	puts "-------------------------------------"

	puts "The programming languages sort by age at :  "
	array_printer(sorted_languages)

	puts "-------------------------------------"


	array_without_java = sorted_languages
	array_without_java.delete_at(3)
	array_printer(array_without_java)

	puts "-------------------------------------"

	shuffled_array = array_without_java.shuffle
	array_printer(shuffled_array)

	puts "-------------------------------------"

	reversed_array = shuffled_array.reverse
	array_printer(reversed_array)

	puts "-------------------------------------"

	languages_under_10 = reversed_array.take_while do | language |
		language.age < 10
	end
	array_printer(languages_under_10)

	puts "-------------------------------------"

	number_of_languages_under_10 = reversed_array.count do | language |
		language.age < 10
	end
	puts number_of_languages_under_10

	puts "-------------------------------------"