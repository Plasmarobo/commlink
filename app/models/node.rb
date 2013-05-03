class Node < ActiveRecord::Base
	belongs_to :player
  	attr_accessible :desc, :firewall, :gm_id, :name, :pilot, :player_id, :programset_id, :response, :signal, :system, :gamesession_id
end
