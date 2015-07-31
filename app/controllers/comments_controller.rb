class CommentsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]

  # index
  def index
      @comments = Comment.all
  end

  #new
  def new
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new

  end

  #create
  def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(comment_params)
      redirect_to post_path(@comment.post_id)
  end

  #show
  def show
      @post = Post.find(params[:post_id])
      @comment = Comment.find(params[:id])
  end

  #edit
  def edit
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(param[:id])
  end

  #update
  def update
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.update(comment_params)
      redirect_to post_path(@comment.post_id)
  end

  #destroy
  def destroy
      @comment = Comment.find(params[:id])
      @post = Post.find(params[:post_id])
      @comment.destroy
      redirect_to post_comment_path(@post)
  end

  private
  def comment_params
      params.require(:comment).permit(:author, :comment_text, :post_date, :post_id)
  end

end
