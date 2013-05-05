class Programset < ActiveRecord::Base
  belongs_to :node
  attr_accessible :id, :analyze, :armor, :attack, :biofeedback_filter, :black_hammer, :blackout, :browse, :command, :data_bomb, :decrypt, :defuse, :eccm, :edit, :encrypt, :exploit, :medic, :node_id, :reality_filter, :scan, :sniffer, :spoof, :stealth, :track


  def create_from_parameters(params)
  	self.analyze = params[:prog_analyze]
    self.armor = params[:prog_armor]
    self.attack = params[:prog_attack]
    self.biofeedback_filter = params[:prog_biofeedback_filter]
    self.black_hammer = params[:prog_black_hammer]
    self.blackout = params[:prog_blackout]
    self.command = params[:prog_command]
    self.data_bomb = params[:prog_data_bomb]
    self.decrypt = params[:prog_decrypt]
    self.defuse = params[:prog_defuse]
    self.eccm = params[:prog_eccm]
    self.edit = params[:prog_edit]
    self.encrypt = params[:prog_encrypt]
    self.exploit = params[:prog_exploit]
    self.medic = params[:prog_medic]
    self.node_id = @node.id
    self.reality_filter = params[:prog_reality_filter]
    self.scan = params[:prog_scan]
    self.sniffer = params[:prog_sniffer]
    self.spoof = params[:prog_spoof]
    self.stealth = params[:prog_stealth]
    self.track = params[:prog_track]
  end

  
 def zero
    self.analyze = 0
    self.armor = 0
    self.attack = 0
    self.biofeedback_filter = 0
    self.black_hammer = 0
    self.blackout = 0
    self.command = 0
    self.data_bomb = 0
    self.decrypt = 0
    self.defuse = 0
    self.eccm = 0
    self.edit = 0
    self.encrypt = 0
    self.exploit = 0
    self.medic = 0
    self.reality_filter = 0
    self.scan = 0
    self.sniffer = 0
    self.spoof = 0
    self.stealth = 0
    self.track = 0
 end


 def atribute_names
        names = { 
        analyze: "Analyze" , 
        armor: "Armor", 
        attack: "Attack", 
        biofeedback_filter: "Biofeedback", 
        black_hammer: "Black Hammer", 
        blackout: "Blackout", 
        browse: "Browse", 
        command: "Command", 
        data_bomb: "Data bomb", 
        decrypt: "Decrypt", 
        defuse: "Defuse", 
        eccm: "Eccm", 
        edit: "Edit", 
        encrypt: "Encrypt", 
        exploit: "Exploit", 
        medic: "Medic", 
        reality_filter: "Reality Filter", 
        scan: "Scan", 
        sniffer: "Sniffer", 
        spoof: "Spoof", 
        stealth: "Stealth", 
        track: "Track"
    }
    return names
    end
    
end
