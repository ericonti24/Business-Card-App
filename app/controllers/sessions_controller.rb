class SessionsController < ApplicationController

  def welcome
    @business_cards = BusinessCard.all
    @categories = Category.all
  end

  def new
  end

  def create 
    if params[:provider] == 'google_oauth2'
      @user = User.create_by_google_omniauth(auth)
      create_session
      
      redirect_to user_path(@user)

    else

      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
      create_session
      redirect_to user_path(@user)
      else
        flash[:error] = "Incorrect username or password."
        redirect_to login_path
      end
    end
  end

  def destroy 
    session.delete(:user_id)
    flash[:notice] = "Successfully logged out."
    redirect_to '/'
  end

  def omniauth
    @user = User.create_by_google_omniauth(auth)
    if @user 
      create_session
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
