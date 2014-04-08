class UsersController < ApplicationController

  before_action :require_authentication, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    redirect_to @user
  end

  def edit
    @user = User.find params[:id]
    redirect_to root_path
  end

  def update
    @user = User.find params[:id]
    redirect_to @user
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
  end

  private
  def user_params
    params[:user].permit(:username, :email, :password, :password_confirmation)
  end

end