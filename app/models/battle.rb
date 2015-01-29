class Battle < ActiveRecord::Base

  #has_many :players, through: assignments
  #has_many :assignments
  # has_and_belongs_to_many :players
  MAX_TURNS = 4

  def cycle one, other
    if over?
      render_win who_won?, who_lost?
      true
    else
      self.battle_log += "\n#{other.user.name} has #{other.hp_actual} HP!"
      other.hp_actual -= one.damage - other.defense
      self.battle_log += "\n#{other.user.name} received #{one.damage - other.defense} damage!"
      self.battle_log += "\n#{other.user.name} has now #{other.hp_actual} HP!\n"
      if over?
        render_win who_won?, who_lost?
        true
      else
        false
      end
    end
  end

  def target
    result = Player.find(self.target_id)
    return result
  end

  def target=player
    self.target_id = player.id
  end

  def starter
    result = Player.find(self.starter_id)
    return result
  end

  def starter=player
    self.starter_id = player.id
  end

  def winner=player
    self.winner_id = player.id
  end

  def winner
    result = Player.find(self.winner_id)
    return result
  end

  def loser=player
    self.loser_id = player.id
  end

  def loser
    result = Player.find(self.loser_id)
    return result
  end

  def players
    a = [starter, target]
    return a
  end

  def turn time
    self.battle_log += "\nTurn #{time}\n ********** \n!"
    if cycle starter, target
      true
    else
      if cycle target, starter
        true
      else
        if time == MAX_TURNS
          self.draw = true
          true
        else
          false
        end
      end
    end
  end


  def render_save
    starter.save
    target.save
    self.save
  end

  # methods that don't need refactor below:
  def over?
    if target.is_dead? || starter.is_dead?
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
    self.starter_id = starter.id
    self.target_id = target.id
    self.battle_log = "Battle started by #{starter.user.name}! The target is #{target.user.name}! \n"
    self.draw = false
    self.battle_time = Time.now
  end

  def who_won?
    if starter.hp_actual > 0
      return starter
    else
      return target
    end
  end

  def who_lost?
    if starter.hp_actual < 0
      return starter
    else
      return target
    end
  end

  def render_win player_winner, player_loser
    winner = player_winner
    loser = player_loser
    winner.kills += 1
    loser.deaths += 1
    self.battle_log += "The player #{winner.user.name} won the battle."
    winner.exp += loser.exp*0.25
    winner.gold += loser.gold*0.25 + 100
  end
end
