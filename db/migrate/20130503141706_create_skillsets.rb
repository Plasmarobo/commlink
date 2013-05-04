class CreateSkillsets < ActiveRecord::Migration
  def up
    create_table :skillsets do |t|
      t.integer :player_id
      t.integer :npc_id
      t.integer :hacking
      t.integer :computer
      t.integer :electronic_warfare
      t.integer :hardware
      t.integer :datasearch
      t.integer :software
      t.integer :cybercombat

      t.timestamps
    end
  end

  def down
    drop_table :skillsets
  end
end
