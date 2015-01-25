class RpgController < ApplicationController
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
end
