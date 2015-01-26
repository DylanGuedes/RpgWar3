class AddLevelToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :level, :integer, :default => 1
  end
end
