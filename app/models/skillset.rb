class Skillset < ActiveRecord::Base
  attr_accessible :computer, :cybercombat, :datasearch, :electronic_warfare, :hacking, :hardware, :npc_id, :player_id, :software

  belongs_to :player
  belongs_to :npc

  def update_from(params)
      #self.player_id = params[:player_id]
      self.npc_id = params[:npc_id]
      self.computer = params[:computer]
      self.cybercombat = params[:cybercombat]
      self.datasearch = params[:datasearch]
      self.electronic_warfare = params[:electronic_warfare]
      self.hacking = params[:hacking]
      self.hardware = params[:hardware]
      self.software = params[:software]
  end

  def create_from(params)
    #Just alias for consitancy, we have no speical operations to perform here
    self.update_from params
  end

  def item_names
    return {
      computer: "Computer", 
      cybercombat: "Cybercombat", 
      datasearch: "Datasearch", 
      electronic_warfare: "Electronic Warfare", 
      hacking: "Hacking", 
      hardware: "Hardware",  
      software: "Software"
    }
  end


end
