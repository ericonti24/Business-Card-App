class CategoriesController < ApplicationController
    # before_action :require_login

    def index 
        @categories = Category.filter_duplicates
        @business_cards = BusinessCard.all 
        @categories = Category.all
    end

    def show 
        # @categories = Category.find_by(id: params[:id])
        # @business_cards = @categories.business_cards
        binding.pry
        
        @business_card = BusinessCard.find(params[:id])
             

    end
end
