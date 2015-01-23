class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.belongs_to :user
      t.integer :deaths
      t.integer :kills
      t.integer :gold
      t.integer :exp
      t.float :hp_max
      t.float :hp_actual
      t.float :damage
      t.boolean :atacable
      t.float :defense
      t.timestamps null: false
    end
  end
end
