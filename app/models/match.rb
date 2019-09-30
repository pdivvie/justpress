class Match < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_and_belongs_to_many :players

  def self.featured_matches
    limit(6)
  end
end
