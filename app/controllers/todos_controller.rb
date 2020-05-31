class TodosController < ApplicationController
    def index
        render plain: Todo.all.to_a
        join("\n")
    end

    def show
        id = params[:id]
        todo=Todo.find(id)
        render plain: todo.to_s
    end
end