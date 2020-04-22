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
    @article = Article.create(params.require(:article).permit(:title, :content))

     if (@article.persisted?) 
      redirect_to @article, notice:"You did buddy,article posted!"
     else   
      render "new", notice: "Something went wrong"
     end 
      
      
  end
  
end