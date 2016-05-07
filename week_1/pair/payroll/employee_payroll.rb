require_relative(hourly_payable.rb)

class Employee
    attr_reader :name, :email #this exists so we can read this data and not have to define it over again with a def and @
    def initialize(name, email)
      @name = name
      @email = email
    end
end

class HourlyEmployee < Employee
  include HourlyPayable
	attr_reader :hourly_rate, :hours_worked
    def initialize(name, email, hourly_rate, hours_worked) #tells hourly employee to ask for inputs
        super(name, email)
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      #returns the hours worked * hourly_rate
      hourly_payable
    end
end

class SalariedEmployee< Employee
	attr_reader:salary
    def initialize(name, email, salary)
        super(name, email)
        @salary=salary
    end

    def calculate_salary #you can repeat these because we're in a different class
    	weekly_salary=@salary/52
    	weekly_salary
      #returns the hours worked * hourly_rate
    end
end

class MultiPaymentEmployee< Employee
	attr_reader:salary, :hourly_rate, :hours_worked
    def initialize(name, email, salary, hourly_rate, hours_worked)
        super(name,email)
        @salary=salary
        @hourly_rate=hourly_rate
        @hours_worked=hours_worked
    end

    def calculate_salary #you can repeat these because we're in a different class
    	weekly_salary=@salary/52
    	additional_salary=@hourly_rate*@hours_worked
    	total_salary=weekly_salary+additional_salary
    	total_salary
      #returns the hours worked * hourly_rate
    end
end

josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)

faraz = HourlyEmployee.new('Faraz', 'farazrocks@example.com', 15, 50)

alia = HourlyEmployee.new('Alia', 'chocolat@example.com', 15, 50)

nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)

ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)

# josh.calculate_salary
# nizar.calculate_salary
# ted.calculate_salary

class Payroll
    def initialize(employees)
        @employees = employees
        @check = 0
    end

  def pay_employees
  	sum_of_employee_salaries=0
  	@employees.each do |employee|
  		puts "#{employee.name} => #{employee.calculate_salary}"
  		sum_of_employee_salaries = sum_of_employee_salaries + employee.calculate_salary #.to_i makes the sting that it's read a number
  		notify_employee(employee)
  	end
  	post_tax_salary=sum_of_employee_salaries + (sum_of_employee_salaries*0.18)
  	puts "The total amount that you owe for this payroll is #{post_tax_salary}"

      # Should output how much we're paying each employee for this week and the total amount spent on payroll this week.
  end

   def notify_employee(employee)
   		puts "#{employee.name}, #{employee.email} HEYYY!! YOU GOT MONEYYYY"
  end
end

employees = [josh, nizar, ted, faraz, alia]
payroll = Payroll.new(employees)
payroll.pay_employees















