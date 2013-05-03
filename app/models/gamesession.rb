class Gamesession < ActiveRecord::Base
  attr_accessible :gm_id, :group_id, :name
  belongs_to :user
  has_one :group
end
