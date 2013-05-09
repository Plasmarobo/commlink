class Node < ActiveRecord::Base
  belongs_to :player
  has_one :user, through: :gamesessions, foreign_key: :gm_id
  belongs_to :gamesession
  has_many :visiblenodes
  has_one :programset
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
