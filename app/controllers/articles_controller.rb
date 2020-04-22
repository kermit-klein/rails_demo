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
      redirect_to :new_article, notice: "Title or content can't be blank"
     end 
  end

  def edit
      @article = Article.find(params[:id])
  end


  def update
      @article = Article.find(params[:id])
      if @article.update(params.require(:article).permit(:title, :content))
        redirect_to @article, notice: "Updated!"
      else
        render 'edit'
      end
  end
  
end