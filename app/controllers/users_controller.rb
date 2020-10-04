class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def index
    @user = User.where('name LIKE ?', "%#{params[:name]}%")
    if @user
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:user_name ,:email, :name, :url_photo)
  end
end
