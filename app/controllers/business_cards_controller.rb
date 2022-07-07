class BusinessCardsController < ApplicationController
    before_action :require_login, :correct_user, only: [:edit, :update, :destroy]

    def new
        @business_card = BusinessCard.new
        @business_card.build_category
    end

    def create
        @business_card = BusinessCard.new(business_card_params)
        @business_card.user_id = session[:user_id]
        
        if @business_card.save
            redirect_to business_card_path(@business_card)
        else
            render :new
        end
    end

    def index 
        @business_cards = BusinessCard.all
    end

    def show 
        get_business_card
    end

    def edit 
        get_business_card
    end

    def update 
        get_business_card
        if  @business_card.update(business_card_params)
            redirect_to business_card_path
        else
            render :edit
        end
    end

    def destroy
        @business_card = BusinessCard.find_by(id: params[:id]).destroy
        redirect_to user_path(session[:user_id])    
    end

    private

    def get_business_card
        @business_card = BusinessCard.find(params[:id])
    end

    def business_card_params
        params.require(:business_card).permit(:name, :email, :web_site, :phone_number, category_attributes: [:name])
    end
end
