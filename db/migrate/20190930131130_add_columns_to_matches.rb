class AddColumnsToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :p1_name, :string
    add_column :matches, :p2_name, :string
    add_column :matches, :p1_character, :string
    add_column :matches, :p2_character, :string
  end
end
