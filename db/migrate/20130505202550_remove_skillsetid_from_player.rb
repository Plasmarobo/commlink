class RemoveSkillsetidFromPlayer < ActiveRecord::Migration
  def up
	remove_column :players, :skillset_id
  end

  def down
	add_column :players, :skillset_id, :integer
  end
end
