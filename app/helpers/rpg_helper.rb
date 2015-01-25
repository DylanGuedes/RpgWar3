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
end
