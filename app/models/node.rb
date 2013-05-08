class Node < ActiveRecord::Base
  belongs_to :player
  belongs_to :user, :foreign_key => :gm_id
  has_many :visiblenodes
  attr_accessible :id, :desc, :firewall, :gamesession_id, :name, :pilot, :player_id, :programset_id, :response, :signal, :system

  def item_names
    return { 
        system: "System", 
        firewall: "Firewall", 
        response: "Response", 
        signal: "Signal", 
        pilot: "Pilot"
    }
  end
end
