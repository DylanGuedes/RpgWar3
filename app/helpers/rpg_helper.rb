module RpgHelper
  def render_player_guard
    if current_user.player.rpg_class.nil?
      redirect_to rpg_path
    end
  end

  def build_from_cosmetic(cosmetic_item)
    desired_item = Item.new
    desired_item.damage = cosmetic_item.damage
    desired_item.defense = cosmetic_item.defense
    desired_item.name = cosmetic_item.name
    desired_item.price = cosmetic_item.price
    return desired_item
  end

  def level_update(current_player)
    exp_array = [300, 900, 1500, 5000, 10000, 150000, 2000000]
    if exp_array[current_player.level] < current_player.exp
      current_player.level += 1
      current_player.save
    end
  end

  def check_death(current_player)
    if current_player.hp_actual < 0
      current_player.atacable = false
      current_player.save
    end
  end
end
