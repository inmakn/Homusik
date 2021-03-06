class UsersController < ApplicationController

  before_action :authorize, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @countries = Country.all
    @cities = City.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    @countries = Country.all
    @cities = City.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(
    :username,
    :lastfm_username,
    :photo_url,
    :city, :country,
    :password, :password_confirmation)
  end

end
