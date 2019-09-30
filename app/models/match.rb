class Match < ApplicationRecord
  belongs_to :game
  belongs_to :user

  def self.featured_matches
    limit(6)
  end
end
