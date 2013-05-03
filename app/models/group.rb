class Group < ActiveRecord::Base
	belongs_to :gamesession
  	attr_accessible :gamesession_id, :player_id
end
