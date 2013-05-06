class AddSkillsetIdToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :skillset_id, :integer
  end
end
