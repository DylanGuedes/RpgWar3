class RpgController < ApplicationController
  def index
    render_guard
    @user = current_user
    @player = current_user.player
    if current_user.player.rpg_class
      world
    end
  end

  def world
  end

  def class_picker
    current_user.player.transform_class(params[:class_picked])
    render 'index'
  end
end
