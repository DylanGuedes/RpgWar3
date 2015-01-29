class AddManaToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :mp_actual, :float, :default => 30
    add_column :players, :mp_max, :float, :default => 30
  end
end
