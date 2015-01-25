module RpgHelper
  def render_player_guard
    if current_user.player.rpg_class.nil?
      redirect_to rpg_path
    end
  end
end
