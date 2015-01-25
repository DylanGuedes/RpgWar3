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
    @itens = Item.all
  end
end
