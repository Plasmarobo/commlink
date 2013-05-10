class Friend < ActiveRecord::Base
  attr_accessible :friend_id, :user_id

  belongs_to :user

  has_one :user, foreign_key: :friend_id

end
