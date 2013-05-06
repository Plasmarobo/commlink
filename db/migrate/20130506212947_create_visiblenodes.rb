class CreateVisiblenodes < ActiveRecord::Migration
  def change
    create_table :visiblenodes do |t|
      t.integer :player_id
      t.integer :node_id

      t.timestamps
    end
  end
end
