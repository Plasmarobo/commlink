class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.integer :player_id
      t.integer :gm_id
      t.string :name
      t.text :desc
      t.integer :programset_id
      t.integer :system
      t.integer :firewall
      t.integer :response
      t.integer :pilot
      t.integer :signal

      t.timestamps
    end
  end
end
