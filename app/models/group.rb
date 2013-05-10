class Group < ActiveRecord::Base
  attr_accessible :gamesession_id, :player_id

  belongs_to :player
  belongs_to :gamesession
end
