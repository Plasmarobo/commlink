class NodeTemplate < ActiveRecord::Base
  belongs_to :user
  has_one :programset, dependent: :destroy
  attr_accessible :desc, :firewall, :name, :pilot, :programset_id, :response, :signal, :signal, :system, :user_id
  def instance_node
    node = Node.new
    node.desc = self.desc
    node.firewall = self.firewall
    node.name = self.name
    node.pilot = self.pilot
    programset = Programset.find_by_id(programset_id).clone
    programset.save
    node.programset_id = programset.id
    node.response = self.response
    node.signal = self.signal
    node.system = self.system
    return node
  end
end
