class Node < ActiveRecord::Base
  attr_accessible :id, :desc, :firewall, :gm_id, :name, :pilot, :player_id, :programset_id, :response, :signal, :system
end
