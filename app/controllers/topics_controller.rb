class TopicsController < ApplicationController

  def show
    @topic = Topic.find(params[:id])

    @articles = @topic.articles.all

  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

end