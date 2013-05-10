class Group < ActiveRecord::Base
  attr_accessible :gamesession_id, :player_id

  belongs_to :player_id
  belongs_to :gamesession
end
