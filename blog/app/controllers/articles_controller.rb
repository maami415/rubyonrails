class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @tag_list = @article.tags.pluck(:tag_name).join(", ")
  end

  def new
    @article = Article.new
    @tag_list = @article.tags.pluck(:tag_name).join(", ")
  end

  def create
    @article = Article.new(article_params)
    tag_list = params[:article][:tag_names].gsub(" ", "").split(",")
    @article.tags_save(tag_list) 

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
    @tag_list = @article.tags.pluck(:tag_name).join(", ")
  end

  def update
    @article = Article.find(params[:id])
    tag_list = params[:article][:tag_names].gsub(" ", "").split(",")
    @article.tags_save(tag_list) 

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end