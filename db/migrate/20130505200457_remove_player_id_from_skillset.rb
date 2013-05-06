class RemovePlayerIdFromSkillset < ActiveRecord::Migration
  def up
	remove_column :skillsets, :player_id
  end

  def down
	add_column :skillsets, :player_id, :integer
  end
end
