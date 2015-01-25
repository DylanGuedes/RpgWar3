class AddRpgClassToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :rpg_class, :string
  end
end
