class BattleController < ApplicationController
  def show
    @battle = Battle.find(params[:id])
  end

  def find_battles
    @player = Player.find(params[:id])
    @started_battles = Battle.where(:starter => @player)
    @targeted_battles = Battle.where(:target => @player)
  end
end
