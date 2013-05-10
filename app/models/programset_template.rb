class ProgramsetTemplate < ActiveRecord::Base
  attr_accessible :analyze, :armor, :attack, :biofeedback_filter, :black_hammer, :blackout, :command, :data_bomb, :decrypt, :defuse, :eccm, :edit, :encrypt, :exploit, :medic, :reality_filter, :scan, :sniffer, :spoof, :stealth, :track, :user_id

  belongs_to :user

  def instance_programset

  end
end
