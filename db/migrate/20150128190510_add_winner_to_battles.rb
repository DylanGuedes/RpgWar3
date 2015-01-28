class AddWinnerToBattles < ActiveRecord::Migration
  def change
    add_column :battles, :winner, :player
    add_column :battles, :loser, :player
  end
end
