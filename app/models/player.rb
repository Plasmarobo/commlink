class Player < ActiveRecord::Base
  attr_accessible :id, :name, :user_id, :programset_id, :skillset_id
end
