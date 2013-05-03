class Gamesession < ActiveRecord::Base
  attr_accessible :gm_id, :group_id, :name
end
