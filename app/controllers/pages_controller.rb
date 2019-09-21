class PagesController < ApplicationController
  def news
    @articles = Article.all.featured_news
    @matches = Match.all.featured_matches
  end

  def faq
  end
end
