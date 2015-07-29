class CommentsController < ApplicationController
  # index
  def index
      @comments = Comment.all
  end

  #new
  def new
      @comment = Comment.new
      @post = Post.find(params[:post_id])
  end

  #create
  def create
      @comment = Comment.create(comment_params)
      redirect_to post_path(@comment.post_id)
  end

  #show
  def show
      @comment = Comment.find(params[:id])
  end

  #edit
  def edit
      @comment = Comment.find(params[:id])
      @post = Post.find(params[:post_id])
  end

  #update
  def update
      @comment = Comment.find(params[:id])
      @post = Post.find(params[:post_id])
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
