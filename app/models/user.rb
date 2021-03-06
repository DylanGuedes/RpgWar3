class User < ActiveRecord::Base
  has_many :messages, dependent: :delete_all
  attr_accessor :remember_token
  has_one :player
  has_many :comments, dependent: :delete_all
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

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attributes({ :remember_digest => User.digest(remember_token) })
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
