class Api::UsersController < ApplicationController
  def index
    @users = User.search(params[:search])
    render :index
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      @posts = @user.posts
      @followers = @user.followers
      @followees = @user.followees
      @not_following = @user.not_following
      render 'show.json.jb'
    else
      render json: ["No user found"], status: 404
    end
  end

  def update
    @user = current_user
    if @user
      if @user.update(user_params)
        render :show
      else
        render json: @user.errors, status: 400
      end
    else
      render json: ["No user found"], status: 404
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :city, :state, :image_url)
  end

end