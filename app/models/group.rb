class Group < ActiveRecord::Base
	belongs_to :gamesession
	belongs_to :player
  attr_accessible :id, :gamesession_id, :player_id
end
