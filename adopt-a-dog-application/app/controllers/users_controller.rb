class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])

    if current_user == @user
      render :show
    else
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])

    if current_user.admin
      render :edit
    elsif current_user == @user
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :admin, :provider, :uid)
  end

end
