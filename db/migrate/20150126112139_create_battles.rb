class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.integer :id_first_player
      t.integer :id_second_player
      t.time :battle_time
      t.string :battle_log, :default => ""
      t.belongs_to :player
      t.timestamps null: false
    end
  end
end
