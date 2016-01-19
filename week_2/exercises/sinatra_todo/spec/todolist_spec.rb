require_relative("../lib/todolist.rb")
require_relative("../lib/task.rb")
require 'yaml/store'

RSpec.describe "TodoList" do
	before :each do
		@todo = TodoList.new("Josh")
		@task = Task.new("Walk the milk")
		@task2 = Task.new("Buy the dog")
	end
	it "checks if task has been added" do
		@todo.add_task(@task)
		expect(@todo.tasks.size).to eq(1)
	end
	it "deletes task by id" do
		@todo.add_task(@task)
		@todo.add_task(@task2)
		@todo.delete_task(@task.id)
		expect(@todo.tasks.size).to eq(1)
	end
	it "finds task by id and returns content" do
		@todo.add_task(@task)
		@todo.add_task(@task2)
		expect(@todo.find_task_by_id(@task2.id)).to eq(@task2)
	end
	it "sorts by time created at and returns sorted array" do
		@todo.add_task(@task2)
		@todo.add_task(@task)
		expect(@todo.sort_by_created("ASC")).to eq([@task, @task2])
		expect(@todo.sort_by_created("DESC")).to eq([@task2, @task])
	end
	it "loads saved file" do
		@todo.add_task(@task)
		@todo.add_task(@task2)
		@todo.save
		@todo.load_tasks
		expect(@todo.tasks.length).to eq(2)
	end
end