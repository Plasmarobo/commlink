
class Gamesession < ActiveRecord::Base
  attr_accessible :id, :gm_id, :group_id, :name
  belongs_to :user, :foreign_key => :gm_id
  has_one :group
  has_many :players, through: :groups
end
