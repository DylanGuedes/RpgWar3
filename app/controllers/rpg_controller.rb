class RpgController < ApplicationController
  include RpgHelper
  def index
    render_guard
    if current_player.rpg_class
      world
    end
  end

  def world
  end

  def class_picker
    current_player.transform_class(params[:class_picked])
    render 'index'
  end

  def store
    render_guard
    render_player_guard
    @cosmetics = CosmeticItem.all
    @itens = Item.all
  end

  def purchase_item
    desired_item = CosmeticItem.find(params[:item_id])

    if current_player.render_gold_guard(desired_item) == true && current_player.render_restriction_guard(desired_item) == true
      puts "#{desired_item}" * 50
      current_player.discount(desired_item)
      current_player.apply(desired_item)
      current_player.items.push(desired_item)
      flash[:notice] = "You purchased a #{desired_item.name}!"
    else
      flash[:notice] = "You can't purchase this item!"
    end
    redirect_to '/rpg/store'
  end

end
