class ArticlesController < ApplicationController

    def index
      @articles = Article.all
    end

    def show
      @article = Article.find(params[:id])
    end

    def new
      # gets the form for create
      @article = Article.new
      # @article.category_id = params[:category_id]
    end

    def edit
      @article = Article.find(params[:id])
    end

    def create
      @article = Article.new(article_params)
      @article.category_id = params[:category_id]
      @category = Category.find(params[:category_id])
      if @article.save
        # redirect_to @category, @article
        redirect_to category_article_path(@category, @article)
      else
        # p @article
        # p "*" * 100
        # p @article.errors.full_messages
        render 'new'
      end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
    end

      private
        def article_params
          params.require(:article).permit(:title, :body)
        end
end
