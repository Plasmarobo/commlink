class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :gamesession_id
      t.integer :player_id

      t.timestamps
    end
  end
end
