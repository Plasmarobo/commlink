class Skillset < ActiveRecord::Base
  attr_accessible :id, :computer, :cybercombat, :datasearch, :electronic_warfare, :hacking, :hardware, :npc_id, :player_id, :software
end
