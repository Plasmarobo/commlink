class AddDefaultsToSkillsets < ActiveRecord::Migration
  def up
  	change_column :skillsets, :hacking, :integer, default: 0
    change_column :skillsets, :computer, :integer, default: 1
    change_column :skillsets, :electronic_warfare, :integer, default: 0
    change_column :skillsets, :hardware, :integer, default: 0
    change_column :skillsets, :datasearch, :integer, default: 1
    change_column :skillsets, :software, :integer, default: 1
    change_column :skillsets, :cybercombat, :integer, default: 0
  end
  def down
  	change_column :skillsets, :hacking, :integer, default: nil
    change_column :skillsets, :computer, :integer, default: nil
    change_column :skillsets, :electronic_warfare, :integer, default: nil
    change_column :skillsets, :hardware, :integer, default: nil
    change_column :skillsets, :datasearch, :integer, default: nil
    change_column :skillsets, :software, :integer, default: nil
    change_column :skillsets, :cybercombat, :integer, default: nil
  end
end
