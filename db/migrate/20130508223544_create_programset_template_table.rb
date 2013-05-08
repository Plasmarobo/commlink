class CreateProgramsetTemplateTable < ActiveRecord::Migration
def up
    create_table :programset_templates do |t|
      t.integer :user_id
      t.string 	:name
      t.integer :analyze, :default => 1
      t.integer :browse, :default => 1
      t.integer :command, :default => 0
      t.integer :edit, :default => 1
      t.integer :encrypt, :default => 0
      t.integer :reality_filter, :default => 0
      t.integer :scan, :default => 1
      t.integer :armor, :default => 0
      t.integer :attack, :default => 0
      t.integer :biofeedback_filter, :default => 0
      t.integer :black_hammer, :default => 0
      t.integer :blackout, :default => 0
      t.integer :data_bomb, :default => 0
      t.integer :decrypt, :default => 0
      t.integer :defuse, :default => 0
      t.integer :eccm, :default => 0
      t.integer :exploit, :default => 0
      t.integer :medic, :default => 0
      t.integer :sniffer, :default => 0
      t.integer :spoof, :default => 0
      t.integer :stealth, :default => 0
      t.integer :track, :default => 0

      t.timestamps
    end
  end

  def down
    drop_table :programset_templates
  end
end
