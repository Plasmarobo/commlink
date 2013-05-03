class Creategamesessions < ActiveRecord::Migration
  def change
    create_table :gamesessions do |t|
      t.integer :group_id
      t.integer :gm_id
      t.string :name

      t.timestamps
    end
  end
end
