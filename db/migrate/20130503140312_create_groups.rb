class CreateGroups < ActiveRecord::Migration
  def up
    create_table :groups do |t|
      t.integer :gamesession_id
      t.integer :player_id

      t.timestamps
    end
  end

  def down
  	drop_table :groups
  end
end
