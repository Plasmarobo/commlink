require 'csv'
class Gamesession < ActiveRecord::Base
  attr_accessible :id, :gm_id, :name
  belongs_to :user, foreign_key: :gm_id
  has_one :group
  has_many :players, through: :groups
  has_many :nodes, foreign_key: :gamesession_id

  validates :name, :presence => true, :uniqueness => true, :length => {:in => 3..30}

  def update_from(params)
    self.name = params[:name]
    self.gm_id = session[:user_id]
  end

  def create_from(params)
    self.update_from(params)
    node_ids = CSV.parse(params[:nodelist_data])
    player_ids = CSV.parse(params[:playerlist_data])
    template_ids = CSV.parse(params[:node_templates])
    node_ids.each do |n|
      node = Node.find_by_id n
      node.gamesession_id = self.id
      node.save
    end
    player_ids.each do |p|
      player = Player.find_by_id p
      group = Group.new
      group.gamesession_id = self.id
      group.player_id = p
      group.save
    end
    template_ids.each do |n|
      node_temp = Node_template.find_by_id n
      node = node_template.instance_node
      node.gamesession_id = self.id
      node.gm_id = self.gm_id
      node.save
    end
  end
end
