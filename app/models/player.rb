class Player < ActiveRecord::Base
  belongs_to :user
  #has_many :assignments
  has_many :items
  #has_many :battles, through: assignments
  def transform_class(id)
    if id.to_i == 1
      self.rpg_class = 'Warrior'
    elsif id.to_i == 2
      self.rpg_class = 'DK'
    end
     self.save
  end

  def battles_started
    battles = Battle.where(:starter => self)
    return battles
  end

  def battles_targeted
    battles = Battle.where(:target => self)
  end

  def can_go_city?
    if self.safe_tick > 5
      return true
    else
      return false
    end
  end

  def restoration
    if self.hp_actual + self.hp_max * 0.2 < self.hp_max
      self.hp_actual += self.hp_max * 0.2
    else
      self.hp_actual = hp_max
    end
    self.save
  end

  def is_dead?
    if self.hp_actual < 0
      return true
    else
      false
    end
  end

  def render_restriction_guard(desired_item)
    if desired_item.restriction && desired_item.restriction.include?(self.rpg_class)
      false
    else
      true
    end
  end

  def render_gold_guard(desired_item)
    if self.gold < desired_item.price
      false
    else
      true
    end
  end

  def enter_jungle
    self.atacable = true
  end

  def apply(desired_item)
    self.damage += desired_item.damage
    self.defense += desired_item.defense
  end

  def discount(desired_item)
    self.gold -= desired_item.price
  end

  def update_turn
    self.safe_tick += 1
    self.exp += 150 + self.exp*0.1
    self.gold += 150
    self.hp_actual -= self.hp_actual*0.1
  end


end
