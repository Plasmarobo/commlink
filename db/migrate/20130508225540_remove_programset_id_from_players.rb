class RemoveProgramsetIdFromPlayers < ActiveRecord::Migration
	def change
		remove_column :players, :programset_id
	end
end
