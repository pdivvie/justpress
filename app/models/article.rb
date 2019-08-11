class Article < ApplicationRecord
  mount_uploader :thumb_image, ArticleUploader
  mount_uploader :main_image, ArticleUploader
end
