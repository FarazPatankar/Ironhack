require_relative("../lib/task.rb")

RSpec.describe "Task" do
	before :each do
		@task = Task.new("Buy the milk")
	end
	it "checks whether completed" do
		expect(@task.complete?).to eq(false)
	end
	it "completes and checks whether completed" do
		@task.complete!
		expect(@task.complete?).to eq(true)
	end
	it "incompletes and checks whether complete" do
		@task.complete!
		@task.make_incomplete!
		expect(@task.complete?).to eq(false)
	end
	it "updates content" do
		@task.update_content!("Walk the milk")
		expect(@task.content).to eq("Walk the milk")
	end
end