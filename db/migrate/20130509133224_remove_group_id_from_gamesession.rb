class RemoveGroupIdFromGamesession < ActiveRecord::Migration
  def change
  	remove_column :gamesessions, :group_id
  end
end
