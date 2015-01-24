class User < ActiveRecord::Base
  after_initialize :default_values
  def default_values
    self.player = Player.new
  end

  has_one :player

  before_save { self.email = email.downcase }

  #validates
  #name
  validates :name, length: { maximum:50, minimum: 2 }

  #email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  #login
  validates :login, length: { maximum:50, minimum: 5 },
                          uniqueness: { case_sensitive: false }

  #password
  validates :password, length: { minimum: 6 }


  has_secure_password
end
