class Player < ActiveRecord::Base
  attr_accessible :name, :programset_id, :skillset_id
end
