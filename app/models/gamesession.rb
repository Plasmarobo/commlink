<<<<<<< HEAD
class Gamesession < ActiveRecord::Base
  attr_accessible :id, :gm_id, :group_id, :name
  belongs_to :user
  has_one :group
end
