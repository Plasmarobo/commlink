class AddPlayerIdToSkillset < ActiveRecord::Migration
  def change
    add_column :skillsets, :player_id, :integer, :after => :view_count
  end
end
