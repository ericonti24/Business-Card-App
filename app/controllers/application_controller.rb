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
        if(user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        end
    end

    def create_session
        session[:user_id] = @user.id 
    end

    def current_user?(user)
        user == current_user
      end

    def correct_user
        @business_card = BusinessCard.find_by(id: params[:id]) 
        unless current_user?(@business_card.user)
          redirect_to user_path(current_user)
        end
    end
end
