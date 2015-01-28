class AddStarterToBattles < ActiveRecord::Migration
  def change
    add_column :battles, :starter, :player
    add_column :battles, :target, :player
  end
end
