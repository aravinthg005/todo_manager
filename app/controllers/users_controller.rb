class UsersController < ApplicationController
  def login
    user_email = params[:email]
    user_password = params[:password]
    user = User.find_by(email: user_email, password: user_password)
    response_text = "True"
    response_text = "False" if user == nil
    render plain: response_text
  end

  def create
    user_new = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    if user_new.save
      session[:current_user_id] = user_new.id
      redirect_to "/"
    else
      flash[:error] = user_new.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
