class CreateJoinTableCharacterMatch < ActiveRecord::Migration[5.2]
  def change
    create_join_table :characters, :matches do |t|
      t.index [:character_id, :match_id]
      t.index [:match_id, :character_id]
    end
  end
end
