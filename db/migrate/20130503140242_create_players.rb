class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :skillset_id
      t.integer :programset_id

      t.timestamps
    end
  end
end
