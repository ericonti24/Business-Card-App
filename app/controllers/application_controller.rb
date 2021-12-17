class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user, :create_session

    private 

    def require_login
        redirect_to login_path unless session[:user_id]
    end

    def logged_in?
        session[:user_id] ? true : false
    end

    def current_user
        session[:user_id]
    end

    def create_session
        session[:user_id] = @user.id 
    end
end
