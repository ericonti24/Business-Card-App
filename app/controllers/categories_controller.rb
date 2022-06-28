class CategoriesController < ApplicationController
    # before_action :require_login

    def index 
        @categories = Category.filter_duplicates
        @business_cards = BusinessCard.all 
        @categories = Category.all
    end

    # def show 
    #     @category = Category.find_by(id: params[:id])
    # end
end
