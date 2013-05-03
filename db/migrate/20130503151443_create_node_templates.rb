class CreateNodeTemplates < ActiveRecord::Migration
  def change
    create_table :node_templates do |t|
      t.integer :user_id
      t.string :name
      t.text :desc
      t.integer :programset_id
      t.integer :system
      t.integer :firewall
      t.integer :response
      t.integer :pilot
      t.integer :signal
      t.integer :signal

      t.timestamps
    end
  end
end
