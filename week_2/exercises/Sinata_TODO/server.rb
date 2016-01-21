
require "sinatra"
require "sinatra/reloader" if development?
require "pry"
require_relative("lib/task.rb")
require_relative("lib/todoList.rb")


task1 = Task.new("Buy the milk")
task2 = Task.new("Walk the dog")
task3 = Task.new("Make my todo list into a web app")

todoList = TodoList.new("Javi")
todoList.add_task(task1)
todoList.add_task(task2)
todoList.add_task(task3)
todoList.save("todoList.yml")

# todoList.load("todoList.yml")

get "/tasks" do
	@new_todoList = todoList

	erb(:task_index)
end

get "/new_task" do
	erb(:new_task)
end

post "/create_task" do
  	content = params[:content]

  	if content == ""
		redirect to("/new_task")
  	else
	  	new_task = Task.new(content)

	  	todoList.add_task(new_task)

		todoList.save("todoList.yml")

		redirect to("/tasks")
	end
end

post "/complete_task/:task_id" do
	task_id = params[:task_completed].to_i

	task = todoList.find_task_by_id(task_id)

	task.complete!

	redirect to("/tasks")
end

post "/undo_task/:task_id" do
	task_id = params[:task_undone].to_i

	task = todoList.find_task_by_id(task_id)

	task.make_incomplete!

	redirect to("/tasks")
end

post "/delete_task/:task_id" do
	task_id = params[:task_deleted].to_i

	todoList.delete_task_by_id(task_id)

	redirect to("/tasks")
end
