
require 'sinatra'
require 'sinatra/reloader'
require_relative("lib/task.rb")
require_relative("lib/todoList.rb")


task1 = Task.new("Buy the milk")
task2 = Task.new("Walk the dog")
task3 = Task.new("Make my todo list into a web app")

todoList = TodoList.new("Javi")
# todoList.add_task(task1)
# todoList.add_task(task2)
# todoList.add_task(task3)
# todoList.save("todoList1.yml")
todoList.load("todoList1.yml")
todoList.save("todoList2.yml")
