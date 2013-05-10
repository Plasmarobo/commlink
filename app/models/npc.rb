class Npc < ActiveRecord::Base
  attr_accessible :desc, :gamesession_id, :gm_id, :name, :node_id, :secret

  belongs_to :user, foreign_key: :gm_id
  belongs_to :gamesession

  has_one :node
end
