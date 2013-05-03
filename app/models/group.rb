class Group < ActiveRecord::Base
  attr_accessible :id, :gamesession_id, :player_id
end
