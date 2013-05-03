class Player < ActiveRecord::Base
	belongs_to :user
	has_many :groups
  	attr_accessible :id, :name, :programset_id, :skillset_id
end