class Battle < ActiveRecord::Base

  #has_many :players, through: assignments
  #has_many :assignments
  # has_and_belongs_to_many :players

  belongs_to :player # it's actually the starter of the fight.

  def cycle one, other
    if over?
      render_win who_won?, who_lost?
      true
    else
      self.battle_log += "\n#{other.user.name} has #{other.hp_actual} HP!"
      other.hp_actual -= one.damage - other.defense
      self.battle_log += "\n#{other.user.name} received #{one.damage} - #{other.defense} damage!"
      self.battle_log += "\n#{other.user.name} has now #{other.hp_actual} HP!\n"
      if over?
        render_win who_won?, who_lost?
        true
      else
        false
      end
    end
  end

  def turn time
    self.battle_log += "\nTurn #{time}\n ********** \n!"
    if cycle self.starter, self.target
      true
    else
      if cycle self.target, self.starter
        true
      else
        if time == MAX_TURNS
          self.draw = true
          true
        end
      end
    end
  end

  # methods that don't need refactor below:
  def over?
    if has_death?
      true
    else
      false
    end
  end

  def draw?
    return self.draw
  end

  def has_death?        #if there's a dead player, the battle isn't a draw.
    !self.draw? ? true : false
  end

  def setup starter, target
    self.starter = starter
    self.target = target
    self.battle_log = "Battle started by #{starter.user.name}! The target is #{target.user.name}! \n"
  end

  def who_won?
    if self.starter.hp_actual > 0
      return self.starter
    else
      return self.target
    end
  end

  def who_lost?
    if self.starter.hp_actual < 0
      return self.starter
    else
      return self.target
    end
  end

  def render_win winner, loser
    self.winner = winner
    self.loser = loser
    winner.kills += 1
    loser.deaths += 1
    self.battle_log += "The player #{winner.user.name} won the battle."
    self.winner.exp += loser.exp*0.25
    self.gold += loser.gold*0.25 + 100
  end
end
