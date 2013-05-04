class CreateGamesessions < ActiveRecord::Migration
  def up
    create_table :gamesessions do |t|
      t.integer :group_id
      t.integer :gm_id
      t.string :name

      t.timestamps
    end
  end

  def down
  	drop_table :gamesessions
  end
end
