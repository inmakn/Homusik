class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:current_user] = user.id
      redirect_to root_path
    else
      flash.now[:login_error] = "oops, that's not your username (or password)"
      render :new
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to login_path
  end

  def error_page
    erb :error
  end

  def wrong_user_page
    erb :wrong_user
  end

end
