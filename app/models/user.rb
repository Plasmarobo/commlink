class User < ActiveRecord::Base
  has_secure_password
  has_many :gamesessions, dependent: :destroy, foreign_key: :gm_id
  has_many :players, dependent: :destroy
  has_many :pals, dependent: :destroy
  has_many :nodes, dependent: :destroy, :foreign_key => :gm_id
  has_many :programset_templates, dependent: :destroy
  
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :username, :presence => true, :uniqueness => true, :length =>  { :in => 3..20 }
	validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
	validates :password, :confirmation => true #password_confirmation attr
	validates_length_of :password, :in => 6..20, :on => :create
	

  attr_accessible :id, :username, :email, :password, :password_confirmation

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
