class AddGamesToMatches < ActiveRecord::Migration[5.2]
  def change
    add_reference :matches, :game, foreign_key: true
  end
end
