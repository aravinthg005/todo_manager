class TodosController < ApplicationController
    def index
        render plain: Todo.all.to_a
        
    end

    def show
        id = params[:id]
        todo=Todo.find(id)
        render plain: todo.to_s
    end

    def create
        todo_text = params[:todo_txt]
        due_date = DateTime.parse(params[:due_date])
        new_todo = Todo.create!(
            todo_txt: todo_text,
            due_date: due_date,
            completed: false
        )
        response_text="YOUR NEW TODO IS CREATED WITH ID: #{new_todo.id}"
        render plain: response_text
    end
end