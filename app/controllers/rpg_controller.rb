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

  def attack_target
    render_guard
    render_player_guard
    if current_player.atacable
      target = Player.find(params[:target_id])
      battle = Battle.new(current_player, target)
      i = 0
      4.times do
        i += 1
        battle.turn current_player, target, i
        break if battle.over?
      end
      render 'index'
    else
      flash[:notice] = "You must be in jungle to attack other players! :("
    end
  end

  # def battle(player1, player2)

  #   while !player1.is_dead? || !player2.is_dead? do
  #     player2.hp_actual -= (player1.damage - player2.defense)
  #     player1.save
  #     player2.save
  #     if player2.is_dead?
  #       player1.exp += player2.exp*0.5
  #       player1.kills += 1
  #       player2.deaths += 1
  #       player1.save
  #       player2.save
  #       break;
  #     else
  #       player1.hp_actual -= (player2.damage - player1.defense)
  #       if player1.is_dead?
  #         player2.exp += player1.exp*0.5
  #         player2.kills += 1
  #         player1.deaths += 1
  #       end
  #       player1.save
  #       player2.save
  #     end
  #   end
  # end

  def class_picker
    current_player.transform_class(params[:class_picked])
    render 'index'
  end

  def targets
    if current_player.atacable == true
      @targets = Player.where(atacable: true)
    else
      flash[:notice] = "You must be in the jungle to attack other players! :("
    end
  end

  def go_jungle
    if current_player.hp_actual < 0
      flash[:error] = "Você está morto! :("
      render 'index'
    else
      current_player.atacable = true
      current_player.save
      render 'index'
    end
  end

  def go_city
    current_player.atacable = false
    current_player.save
    render 'index'
  end

  def store
    render_guard
    render_player_guard
    @cosmetics = CosmeticItem.all
    @itens = Item.all
  end

  def jungle
    render_guard
    render_player_guard
    current_player.enter_jungle
  end

  def purchase_item
    cosmetic = CosmeticItem.find(params[:item_id])
    desired_item = build_from_cosmetic(cosmetic)
    if current_player.render_gold_guard(desired_item) == true && current_player.render_restriction_guard(desired_item) == true
      current_player.discount(desired_item)
      current_player.apply(desired_item)
      current_player.save
      current_player.items.push(desired_item)
      flash[:notice] = "You purchased a #{desired_item.name}!"
    else
      flash[:notice] = "You can't purchase this item!"
    end
    redirect_to '/rpg/store'
  end

end
