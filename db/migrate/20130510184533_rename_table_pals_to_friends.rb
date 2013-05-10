class RenameTablePalsToFriends < ActiveRecord::Migration
  def up
  	rename_table :pals, :friends
  	rename_column :friends, :pal_id, :friend_id
  end

  def down
  	rename_column :friends, :friend_id, :pal_id
  	rename_table :friends, :pals
  end
end
