class AddGameSessionIdToNode < ActiveRecord::Migration
  def up
    add_column :nodes, :gamesession_id, :integer, after: :player_id
    remove_column :nodes, :gm_id
  end

  def down
  	remove_column :nodes, :gamesession_id
  	add_column :nodes, :gm_id, :integer
  end
end
