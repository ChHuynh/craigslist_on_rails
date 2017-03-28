class CategoriesController < ApplicationController

    def index
      @categories = Category.all
    end

    def show
      @category = Category.find(params[:id])
      @articles = Article.where(category_id: params[:id])
    end

    def new
    end

    def edit
    end

    def create
    end

    def destroy
    end

end
