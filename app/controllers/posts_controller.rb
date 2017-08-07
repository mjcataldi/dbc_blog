class PostsController < ApplicationController
  
  def index
    @posts = Post.all.order("created_at DESC")
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.save
    
    redirect_to @post
  end
  
  def update
    @post = Post.find(params[:id])
  end
  
  def destroy
    Post.find(params[:id]).destroy
  end
  
  private 
  def post_params
    params.require(:post).permit(:title, :body)
  end
  
end
