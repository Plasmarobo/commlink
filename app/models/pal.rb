class Pal < ActiveRecord::Base
  belongs_to :user
  has_one :user, :foreign_key => :pal_id
  attr_accessible :id, :pal_id, :user_id
end
