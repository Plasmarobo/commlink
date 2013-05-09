
class Gamesession < ActiveRecord::Base
  attr_accessible :id, :gm_id, :name
  belongs_to :user
  has_many :groups
  has_many :players, through: :groups
  has_many :nodes

  # validates :name, :presence => true, :uniqueness => true, :length => {:in => 3..30}
  validates :name, :presence => true, :length => {:in => 3..30}
  # validates :group, :presence => true

  def update_from(params)
    self.name = params[:name]
    self.gm_id = session[:user_id]
    self.group_id = params[:group_id]
  end
end
