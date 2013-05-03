class CreateNpcs < ActiveRecord::Migration
  def change
    create_table :npcs do |t|
      t.string :name
      t.text :desc
      t.text :secret
      t.integer :node_id
      t.integer :gamesession_id
      t.integer :gm_id

      t.timestamps
    end
  end
end
