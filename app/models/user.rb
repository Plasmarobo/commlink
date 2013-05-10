class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation, :password_digest, :username

  has_many :gamesessions
  has_many :players
  has_many :friends
  has_many :nodes
  has_many :programset_templates
  has_many :node_templates

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, uniqueness: true, length:  { :in => 3..20 }
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
  validates :password, confirmation: true 
  validates_length_of :password, :in => 6..20, on: :create

  def self.uauthenticate(username_or_email="", login_password="")
    if EMAIL_REGEX.match(username_or_email)
      user = User.find_by_email(username_or_email).try(:authenticate, login_password);
    else
      user = User.find_by_username(username_or_email).try(:authenticate, login_password);
    end
    
    if user
      return user
    else
      return false
    end
  end
  
end
