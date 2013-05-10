class Visiblenode < ActiveRecord::Base
  attr_accessible :node_id, :player_id

  belongs_to :player
  belongs_to :node
end
