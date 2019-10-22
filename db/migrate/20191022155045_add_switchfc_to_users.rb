class AddSwitchfcToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :switchfc, :string
  end
end
