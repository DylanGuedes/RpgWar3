class Player < ActiveRecord::Base
  exp_array = [300, 900, 1500, 5000, 10000, 150000, 2000000]
  belongs_to :user
  #has_many :assignments
  has_many :items
  #has_many :battles, through: assignments
  def transform_class(id)
    picked_class = PickableClass.find(id)
    self.rpg_class = picked_class.name
    self.save
  end

  def playable?
    if self.rpg_class == nil
      false
    else
      true
    end
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

  def hp_percentual
    x = 100 * self.hp_actual / self.hp_max
    return x
  end

  def exp_percentual
    exp_needed = exp_array[self.level+1]
    x = 100 * self.exp / exp_needed
    return x
  end


end
