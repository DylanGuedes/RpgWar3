class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.belongs_to :user
      t.integer :deaths, :default => 0
      t.integer :kills, :default => 0
      t.integer :gold, :default => 100
      t.integer :exp, :default => 0
      t.float :hp_max, :default => 100
      t.float :hp_actual, :default => 100
      t.float :damage, :default => 15
      t.boolean :atacable, :default => false
      t.float :defense, :default => 0
      t.timestamps null: false
    end
  end
end
