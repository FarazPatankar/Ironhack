
require_relative("lib/task.rb")


describe Task do
	before :each do
		@task = Task.new("")
	end

  	describe "#complete!" do
    	it "completes the task" do
          @task.complete!
      		expect(@task.completed?).to be true
    	end
  	end
end