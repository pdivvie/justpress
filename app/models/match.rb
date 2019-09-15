class Match < ApplicationRecord
  belongs_to :game
  has_and_belongs_to_many :players

  scope :players, -> { where link: 'https://youtu.be/pXnw5dmtd3M?t=4482' }
end
