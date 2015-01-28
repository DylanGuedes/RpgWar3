class ChangeBattleLogToUnlimited < ActiveRecord::Migration
  def change
    change_column :battles, :battle_log, :string, :limit => nil
  end
end
