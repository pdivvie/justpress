class AddPlayer2ToMatch < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :player_2, :string
  end
end
