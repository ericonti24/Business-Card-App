class SessionsController < ApplicationController

  def welcome
  end

  def new
  end

  def create 
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      create_session
      redirect_to user_path(@user)
    else
      flash[:error] = "Incorrect username or password."
      redirect_to login_path
    end
  end

  def destroy 
    session.delete(:user_id)
    flash[:notice] = "Successfully logged out."
    redirect_to '/'
  end
end
