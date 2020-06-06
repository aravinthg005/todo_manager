class TodosController < ApplicationController
  def index
    render "index"
  end

  def show
    id = params[:id]
    todo = Todo.find(id)
    render "todo"
    #render plain: todo.to_s
  end

  def create
    todo_text = params[:todo_txt]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(
      todo_txt: todo_text,
      due_date: due_date,
      completed: false,
    )
    response_text = "YOUR NEW TODO IS CREATED WITH ID: #{new_todo.id}"
    render plain: response_text
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    render plain: "updated the todo ::#{completed}"
  end
end
