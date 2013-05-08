class ProgramsetTemplate < ActiveRecord::Base
  attr_accessible :id, :name, :analyze, :armor, :attack, :biofeedback_filter, :black_hammer, :blackout, :browse, :command, :data_bomb, :decrypt, :defuse, :eccm, :edit, :encrypt, :exploit, :medic, :reality_filter, :scan, :sniffer, :spoof, :stealth, :track
  belongs_to :user
end
