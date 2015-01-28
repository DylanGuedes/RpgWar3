class AddDrawToBattles < ActiveRecord::Migration
  def change
    add_column :battles, :draw, :boolean
  end
end
