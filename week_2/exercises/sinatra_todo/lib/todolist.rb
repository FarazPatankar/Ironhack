require 'yaml/store'
class TodoList
    attr_reader :tasks, :user
    def initialize(user)
    	@user = user
        @tasks = []
        @todo_store = YAML::Store.new("../tasks.yml")
    end

    def add_task(task)
    	@tasks << task
    end

    def delete_task(task_id)
    	@tasks = @tasks.delete_if do |task|
    		task.id == task_id
    	end
    	@tasks
    end

    def find_task_by_id(task_id)
    	required_task = nil
    	@tasks.each do |task|
    		if task.id == task_id
    			required_task = task
    		end
    	end
    	required_task
    end

    def sort_by_created(string)
    	if string == "ASC"
	    	sorted_tasks = @tasks.sort do |task_1, task_2|
	    		task_1.created_at <=> task_2.created_at
	    	end
	    elsif string == "DESC"
	    	sorted_tasks = @tasks.sort do |task_1, task_2|
	    		task_2.created_at <=> task_1.created_at
	    	end
	    end
    	sorted_tasks
    end

    def save
	    @todo_store.transaction do
	      @todo_store[@user] = @tasks
		end
	end

	def load_tasks
		@todo_store.transaction do
			@tasks = @todo_store[@user]
		end
		@tasks
	end
end