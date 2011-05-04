class UsersController < ApplicationController

  def index
    @users = User.find(:all)
  end
  
  def new
    @user = User.new()
  end

  def create
    @user = User.new(params[:user])
    @user.save
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to users_path
  end

end
