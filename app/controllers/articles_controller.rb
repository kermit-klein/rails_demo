class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end  

  def create
    @article = Article.new(params.require(:article).permit(:title, :content))

    @article.save == nil ? (render "new") : (redirect_to @article)
  end
  
end