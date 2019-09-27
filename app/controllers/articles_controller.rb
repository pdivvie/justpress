class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_topics, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @topic = @article.topic
  end

  def new
    @article = Article.new
    authorize @article
  end

  def edit
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    authorize @article

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    authorize @article
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @article
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def set_topics
    @topics = Topic.all
  end

  def article_params
    params.require(:article).permit(:title, :body, :main_image, :thumb_image, :topic_id)
  end
end
