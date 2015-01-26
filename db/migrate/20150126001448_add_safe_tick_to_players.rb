class AddSafeTickToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :safe_tick, :integer, :default => 0
  end
end
