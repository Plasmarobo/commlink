class Node < ActiveRecord::Base
  belongs_to :player
  belongs_to :user, :foreign_key => :gm_id
  attr_accessible :id, :desc, :firewall, :gm_id, :name, :pilot, :player_id, :programset_id, :response, :signal, :system
end
