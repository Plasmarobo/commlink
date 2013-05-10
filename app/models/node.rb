class Node < ActiveRecord::Base

  attr_accessible :desc, :firewall, :gamesession_id, :name, :pilot, :player_id, :programset_id, :response, :signal, :system

  belongs_to :player
  belongs_to :gamesession

  has_one :programset
  # has_one :user, through: :gamesession, foreign_key: :gm_id #Note, not always true.

  has_many :visiblenodes

  def item_names
    return { 
        system: "System", 
        firewall: "Firewall", 
        response: "Response", 
        signal: "Signal", 
        pilot: "Pilot"
    }
  end

  def create_from(params)
    programset = Programset.new
    if programset.create_from params
      self.programset_id = programset.id
    else
      return false
    end
    self.create(params)
    return self.save
  end

end
