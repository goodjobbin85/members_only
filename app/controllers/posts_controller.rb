class PostsController < ApplicationController
  before_action :require_sign_in, except: [:index]
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Thanks for contributing!"
      redirect_to posts_path
    else
      flash[:danger] = "Woops! Try again!"
      render :new
    end 
  end

  def index
    @posts = Post.all
  end
  
  private 
  
  def post_params
    params.require(:post).permit(:description)
  end
  
end
