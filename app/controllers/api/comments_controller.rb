class Api::CommentsController < ApplicationController
  def index
    @comments = Comment.where("post_id = ?", params[:post_id])
    render :index
  end

  def create
    @comment = Comment.new(
      post_id: params[:post_id],
      body: params[:body],
      user: current_user
    )
    # @comment.user = current_user
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      render :show
    else
      render json: @comment.errors, status: 422
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render json: {}
    else
      render json: @comment.errors
    end
  end

end