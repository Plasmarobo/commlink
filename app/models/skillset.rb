class Skillset < ActiveRecord::Base
  attr_accessible :computer, :cybercombat, :datasearch, :electronic_warfare, :hacking, :hardware, :npc_id, :player_id, :software

  belongs_to :player
  belongs_to :npc

  def update_from(params)
      self.computer = params[:skill_computer]
      self.cybercombat = params[:skill_cybercombat]
      self.datasearch = params[:skill_datasearch]
      self.electronic_warfare = params[:skill_electronic_warfare]
      self.hacking = params[:skill_hacking]
      self.hardware = params[:skill_hardware]
      self.software = params[:skill_software]
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
