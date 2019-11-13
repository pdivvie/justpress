class Game < ApplicationRecord
  has_many :matches
  has_many :characters
end
