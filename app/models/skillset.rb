class Skillset < ActiveRecord::Base
  belongs_to :player
  attr_accessible :id, :computer, :cybercombat, :datasearch, :electronic_warfare, :hacking, :hardware, :npc_id, :player_id, :software
  
  def create_from_parameters(params)
      self.computer = params[:skill_computer]
      self.computer = params[:skill_cybercombat]
      self.computer = params[:skill_datasearch]
      self.computer = params[:skill_electronic_warfare]
      self.computer = params[:skill_hacking]
      self.computer = params[:skill_hardware]
      self.computer = params[:skill_software]
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
