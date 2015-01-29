class AddWinnerToBattles < ActiveRecord::Migration
  def change
    add_column :battles, :winner_id, :integer
    add_column :battles, :loser_id, :integer
  end
end
