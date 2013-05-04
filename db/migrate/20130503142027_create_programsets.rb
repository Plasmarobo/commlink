class CreateProgramsets < ActiveRecord::Migration
  def up
    create_table :programsets do |t|
      t.integer :node_id
      t.integer :analyze
      t.integer :browse
      t.integer :command
      t.integer :edit
      t.integer :encrypt
      t.integer :reality_filter
      t.integer :scan
      t.integer :armor
      t.integer :attack
      t.integer :biofeedback_filter
      t.integer :black_hammer
      t.integer :blackout
      t.integer :data_bomb
      t.integer :decrypt
      t.integer :defuse
      t.integer :eccm
      t.integer :exploit
      t.integer :medic
      t.integer :sniffer
      t.integer :spoof
      t.integer :stealth
      t.integer :track

      t.timestamps
    end
  end

  def down
    drop_table :programsets
  end
end
