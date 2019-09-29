class UsersController < ApplicationController
    
   def index 
       @users = User.all
   end
   
   def new
    @user = User.new
   end
   
   def show 
       @user = User.find(params[:id])
   end
   
   def create 
       @user = User.new(params[:id])
       if @user.update(user_params)
           flash[:success] = "Welcome, #{@user.email}"
           login_user(@user)
           redirect_to root_path
       else
           flash[:danger] = "Please try again."
           render :new
       end
   end
   
   private
   
   def user_params
       params.require(:user).permit(:email, :password)
   end
end
