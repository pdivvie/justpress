class Article < ApplicationRecord
  belongs_to :topic
  validates_presence_of :title, :body, :topic_id

  mount_uploader :thumb_image, ArticleUploader
  mount_uploader :main_image, ArticleUploader

  def self.featured_news
    limit(4)
  end

end
