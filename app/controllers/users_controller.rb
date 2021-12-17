class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            create_session
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show 
        require_login
        @user = User.find_by(params[:id])
        redirect_to '/' if !@user
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
