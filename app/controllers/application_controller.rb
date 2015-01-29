class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include RpgHelper
  include MessagesHelper

  MAX_TURNS = 4

  # def turn_tick
  #   last_tick = Time.now
  #   loop do
  #     sleep 0.1
  #     if Time.now - last_tick >= 600 #600 seconds = 10 min
  #       new_turn
  #       last_tick = Time.now
  #     end
  #   end
  # end
  def new_ticks
    Thread.new do
      while true do
        puts Time.now # or call tick function
        new_turn
        sleep 100
      end
    end
  end

  def level_ticks
    Thread.new do
      while true do
        a = Player.all
        a.each do |p|
          level_update(p)
          check_death(p)
        end
        sleep 5
      end
    end
  end

  def new_turn
    a = Player.where(atacable: true)
    a.each do |k|
      k.safe_tick += 1
      k.exp += 150
      k.exp += k.exp*0.1
      k.gold += 150
      k.hp_actual -= k.hp_actual*0.1
      k.save
    end
    b = Player.where(atacable: false)
    b.each do |r|
      r.restoration
    end
  end
end
