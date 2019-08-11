class PagesController < ApplicationController
  def news
    @articles = Article.all
  end
end
