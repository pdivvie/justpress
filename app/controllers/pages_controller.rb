class PagesController < ApplicationController
  def news
    @articles = Article.all.featured_news
  end

  def faq
  end
end
