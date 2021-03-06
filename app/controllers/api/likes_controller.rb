class Api::LikesController < ApplicationController
  def index
    @likes = Post.find(params[:post_id]).likes
    render json: @likes
  end

  def create
    @like = Like.new(
      post_id: params[:post_id],
      user_id: current_user
    )
    @like.post = Post.find(params[:post_id])
    if @like.save
      render json: @like
    else
      render json: @like.errors, status: 400
    end
  end

  def destroy
    @like = Like.find(params[:id])

    if @like.destroy
      render json: @like
    else
      render json: @like.errors, status: 404
    end
  end
end