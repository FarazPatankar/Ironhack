
require 'yaml/store'


class TodoList
    attr_reader :user, :tasks

    def initialize(user)
        @tasks = []
        @user = user
    end

    def add_task(task)
    	@tasks.push(task)
    end

    def delete_task_by_id(task_id)
    	@tasks.delete_if do |t|
    		t.id == task_id
    	end
    end

    def find_task_by_id(task_id)
    	@tasks.find do |t|
    		t.id == task_id
    	end
    end

    def sort_by_id(dir)
        if dir == "ASC"
        	@tasks.sort! do |t1, t2|
        		t1.id <=> t2.id
        	end
        elsif dir == "DESC"
            @tasks.sort! do |t1, t2|
                t2.id <=> t1.id
            end
        end
    end

    def sort_by_created(dir)
    	if dir == "ASC"
	    	@tasks.sort! do |t1, t2|
	    		t1.created_at <=> t2.created_at
	    	end
	    elsif dir == "DESC"
	    	@tasks.sort! do |t1, t2|
	    		t2.created_at <=> t1.created_at
	    	end
	    end
    end

    def save(filename)
        @todo_store = YAML::Store.new("./public/#{filename}")

  		@todo_store.transaction do 
      		@todo_store[@user] = @tasks
  		end
	end

    def load(filename)
        @todo_store = YAML::Store.new("./public/#{filename}")

        @todo_store.transaction do 
            @tasks = @todo_store[@user]
        end
    end    
end
