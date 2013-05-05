class AddGMidAndRemoveGamessionidFromNodes < ActiveRecord::Migration
  def up
      remove_column :nodes, :gamesession_id
      add_column :nodes, :gm_id, :integer
  end

  def down
      add_column :nodes, :gamesession_id, :integer
      remove_column :nodes, :gm_id
  end
end
