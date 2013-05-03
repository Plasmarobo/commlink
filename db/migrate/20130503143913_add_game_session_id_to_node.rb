class AddGameSessionIdToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :gamesession_id, :integer, after: :player_id
    remove_column :nodes, :gm_id
  end
end
