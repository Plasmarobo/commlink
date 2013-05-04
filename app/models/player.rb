class Player < ActiveRecord::Base
	belongs_to :user
	has_many :groups
	has_many :gamesessions, through: :groups
	has_one :skillset, dependent: :destroy
  	attr_accessible :id, :user_id, :name, :programset_id, :skillset_id
end