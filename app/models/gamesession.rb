class gamesession < ActiveRecord::Base
  attr_accessible :id, :gm_id, :group_id, :name
end
