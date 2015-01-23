class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation

  after_initialize :default_values
  def default_values
    self.player = Player.new
  end

  has_one :player
end
