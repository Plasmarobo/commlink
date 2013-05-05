class NodeTemplate < ActiveRecord::Base
  belongs_to :user
  attr_accessible :desc, :firewall, :name, :pilot, :programset_id, :response, :signal, :signal, :system, :user_id
end
