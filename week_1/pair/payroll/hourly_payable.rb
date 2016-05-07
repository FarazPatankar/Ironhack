module HourlyPayable
	def hourly_payable
		@hourly_rate*@hours_worked
	end
end