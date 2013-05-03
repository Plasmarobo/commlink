class Npc < ActiveRecord::Base
  attr_accessible :desc, :gamesession_id, :gm_id, :name, :node_id, :secret
end
