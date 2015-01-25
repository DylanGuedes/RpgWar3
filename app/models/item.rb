class Item < ActiveRecord::Base
  def build_from_cosmetic(cosmetic_item)
    desired_item = Item.new
    desired_item.damage = cosmetic_item.damage
    desired_item.name = cosmetic_item.name
    return desired_item
  end
end
