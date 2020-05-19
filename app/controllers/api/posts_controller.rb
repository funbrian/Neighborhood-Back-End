class Api::PostsController < ApplicationController
  def index
    # if params.has_key?(:user_id)
    #   # @posts = Post.where(author_id: params[:user_id]
    @posts = Post.all
    render 'index.json.jb'
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.user_id = current_user.id
    @post.username = current_user.username
    # if params.has_key?(:user_id)
    #   unless current_user.id == params[:user_id].to_i
    #     @post.tagged_user = params[:user_id]
    #   end
    # end

    if @post.save
      render :show
    else
      render json: @post.errors, status: 422
    end
  end

  def show
    @post = Post.find(params[:id])
    if @post
      render 'show.json.jb'
    else
      render json: ["post not found"], status: 404
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render :show
    else
      render json: @post.errors.full_messages, status: 422
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      render :show
    else
      render json: @post.errors.full_messages, status: 422
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :status, :genre, :username, :image_url, :file)
  end
end