class Node < ActiveRecord::Base
  attr_accessible :desc, :firewall, :gm_id, :name, :pilot, :player_id, :programset_id, :response, :signal, :system
end
