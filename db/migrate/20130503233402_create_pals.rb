class CreatePals < ActiveRecord::Migration
  def change
    create_table :pals do |t|
      t.integer :user_id
      t.integer :pal_id

      t.timestamps
    end
  end
end
