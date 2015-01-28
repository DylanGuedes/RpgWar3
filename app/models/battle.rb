class Battle < ActiveRecord::Base
  #has_many :players, through: assignments
#has_many :assignments
#  has_and_belongs_to_many :players

  belongs_to :player # it's actually the starter of the fight.

  def victory first, second
    if first.is_dead?
      first.deaths += 1
      second.kills += 1
      self.battle_log += "The player #{second.user.name} won the battle."
      render_win first
    else
      second.deaths += 1
      first.kills += 1
      self.battle_log += "The player #{first.user.name} won the battle."
      render_win second
    end
    first.save
    second.save
    self.save
  end

  def render_win player
    player.exp += player.exp*0.25
    player.gold += player.gold*0.25
  end



  def turn first, second, time
    if self.battle_log.nil?
      self.battle_log = ""
    end
    self.battle_log += "Turn #{time}\n ********** \n!"
    if over?(first, second)
      victory first, second
      false
    else
      puts self.battle_log
      puts battle_log
      self.battle_log += "\n#{second.user.name} has #{second.hp_actual}!"
      second.hp_actual -= first.damage - second.defense
      self.battle_log += "\n#{second.user.name} taken #{first.damage} - #{second.defense}!"
      self.battle_log += "\n#{second.user.name} has now #{second.hp_actual} HP!"
      if over? first, second
       victory first, second
      else
        self.battle_log += "\n#{first.user.name} has #{first.hp_actual}!"
        first.hp_actual -= second.damage - first.defense
        self.battle_log += "\n#{first.user.name} taken #{second.damage} - #{first.defense}!"
        self.battle_log += "\n#{first.user.name} has now #{first.hp_actual} HP!"

        if over? first, second
         victory first, second
        end
      end
    end
  end

  # methods that don't need refactor below:
  def draw?
    return self.draw
  end

  def has_death?        #if there's a dead player, the battle isn't a draw.
    !self.draw? ? true : false
  end
end
