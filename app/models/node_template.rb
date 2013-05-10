class NodeTemplate < ActiveRecord::Base
  attr_accessible :desc, :firewall, :name, :pilot, :programset_id, :response, :signal, :system, :user_id

  belongs_to :user

  has_one :programset


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
