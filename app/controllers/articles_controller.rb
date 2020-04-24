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
      redirect_to @article
      flash[:notice]="You did buddy,article posted!"
     else   
      flash[:notice] = "Title or content can't be blank"
      redirect_to :new_article
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

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
  redirect_to articles_path
  end
  
end