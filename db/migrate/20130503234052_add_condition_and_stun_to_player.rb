class AddConditionAndStunToPlayer < ActiveRecord::Migration
  def up
  	add_column :players, :condition, :integer
  	add_column :players, :stun, :integer
  end

  def down
  	remove_column :players, :condition
  	remove_column :players, :stun
  end
end
