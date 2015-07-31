class PostsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]
  # index
  def index
    @posts = Post.all
  end

  #new
  def new
      @post = Post.new
  end

  #create
  def create
      @post = Post.create(post_params)
      #manually associate the current_user.id to the post 
      @post.update({
          user_id: current_user.id
         })
      redirect_to post_path(@post)
  end

  #show
  def show
      @post = Post.find(params[:id])
      @user = current_user
      @comment = Comment.new
  end

  #edit
  def edit
      @post = Post.find(params[:id])

  end

  #update
  def update
      @post = Post.find(params[:id])
      #if current_user.id == @post.user_id
     @post.update(post_params)
     # end
      redirect_to post_path(@post)
  end

  #destroy
  def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
  end


  private
  def post_params
      params.require(:post).permit(:title, :author, :text, :post_date, :photo_url, :user_id)
  end
end
