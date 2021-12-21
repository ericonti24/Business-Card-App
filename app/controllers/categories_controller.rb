class CategoriesController < ApplicationController
    before_action :require_login

    def index 
        @categories = Category.filter_duplicates
        @business_cards = BusinessCard.all 
    end
end
