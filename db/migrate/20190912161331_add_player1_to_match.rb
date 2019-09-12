class AddPlayer1ToMatch < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :player_1, :string
  end
end
