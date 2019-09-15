class CreateJoinTablePlayerMatch < ActiveRecord::Migration[5.2]
  def change
    create_join_table :players, :matches do |t|
      t.index [:player_id, :match_id]
      t.index [:match_id, :player_id]
    end
  end
end
