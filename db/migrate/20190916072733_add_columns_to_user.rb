class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :steamid, :string
    add_column :users, :psnid, :string
    add_column :users, :gamertag, :string
  end
end
