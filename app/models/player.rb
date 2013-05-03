class Player < ActiveRecord::Base
  attr_accessible :id, :name, :programset_id, :skillset_id
end
