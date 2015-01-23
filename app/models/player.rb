class Player < ActiveRecord::Base
  belongs_to :user

  after_initialize :default_values
  def default_values
    self.damage = 15
    self.hp_max = 50
    self.hp_actual = 50
    self.defense = 0
    self.atacable = false
    self.exp = 0
    self.gold = 100
    self.deaths = 0
    self.kills = 0
  end
end
