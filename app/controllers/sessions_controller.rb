class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login_user(user)
      flash.now[:success] = "Welcome #{user.email}."
      redirect_to root_path
    else
      flash.now[:danger] = "Please provide correct credentials."
    end
  end
  
  def destroy
    logout_user
    redirect_to root_path
  end
end
