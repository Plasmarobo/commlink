class CreatePlayers < ActiveRecord::Migration
  def up
    create_table :players do |t|
      t.string :name
      t.integer :skillset_id
      t.integer :programset_id

      t.timestamps
    end
  end

  def down
  	drop_table :players
  end
end
