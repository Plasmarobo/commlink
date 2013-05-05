class AddDefaultToProgramsets < ActiveRecord::Migration
  def up
    change_column :programsets, :analyze, 			:integer, :default => 1
    change_column :programsets, :browse, 			:integer, :default => 1
    change_column :programsets, :command, 			:integer, :default => 0
    change_column :programsets, :edit, 				:integer, :default => 1
    change_column :programsets, :encrypt, 			:integer, :default => 0
    change_column :programsets, :reality_filter, 	:integer, :default => 0
    change_column :programsets, :scan, 				:integer, :default => 1
    change_column :programsets, :armor, 			:integer, :default => 0
    change_column :programsets, :attack, 			:integer, :default => 0
    change_column :programsets, :biofeedback_filter,:integer, :default => 0
    change_column :programsets, :black_hammer, 		:integer, :default => 0
    change_column :programsets, :blackout, 			:integer, :default => 0
    change_column :programsets, :data_bomb, 		:integer, :default => 0
    change_column :programsets, :decrypt, 			:integer, :default => 0
    change_column :programsets, :defuse, 			:integer, :default => 0
    change_column :programsets, :eccm, 				:integer, :default => 0
    change_column :programsets, :exploit, 			:integer, :default => 0
    change_column :programsets, :medic, 			:integer, :default => 0
    change_column :programsets, :sniffer, 			:integer, :default => 0
    change_column :programsets, :spoof, 			:integer, :default => 0
    change_column :programsets, :stealth, 			:integer, :default => 0
    change_column :programsets, :track, 			:integer, :default => 0
  end
	def down
    change_column :programsets, :analyze, 			:integer, :default => nil
    change_column :programsets, :browse, 			:integer, :default => nil
    change_column :programsets, :command, 			:integer, :default => nil
    change_column :programsets, :edit, 				:integer, :default => nil
    change_column :programsets, :encrypt, 			:integer, :default => nil
    change_column :programsets, :reality_filter, 	:integer, :default => nil
    change_column :programsets, :scan, 				:integer, :default => nil
    change_column :programsets, :armor, 			:integer, :default => nil
    change_column :programsets, :attack, 			:integer, :default => nil
    change_column :programsets, :biofeedback_filter,:integer, :default => nil
    change_column :programsets, :black_hammer, 		:integer, :default => nil
    change_column :programsets, :blackout, 			:integer, :default => nil
    change_column :programsets, :data_bomb, 		:integer, :default => nil
    change_column :programsets, :decrypt, 			:integer, :default => nil
    change_column :programsets, :defuse, 			:integer, :default => nil
    change_column :programsets, :eccm, 				:integer, :default => nil
    change_column :programsets, :exploit, 			:integer, :default => nil
    change_column :programsets, :medic, 			:integer, :default => nil
    change_column :programsets, :sniffer, 			:integer, :default => nil
    change_column :programsets, :spoof, 			:integer, :default => nil
    change_column :programsets, :stealth, 			:integer, :default => nil
    change_column :programsets, :track, 			:integer, :default => nil
  end
end
