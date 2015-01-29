class AddStarterToBattles < ActiveRecord::Migration
  def change
    add_column :battles, :starter_id, :integer
    add_column :battles, :target_id, :integer
  end
end
