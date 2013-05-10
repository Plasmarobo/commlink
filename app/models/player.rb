class Player < ActiveRecord::Base
  attr_accessible :condition, :name, :skillset_id, :stun, :user_id

  belongs_to :user

  has_one :skillset

  has_many :groups
  has_many :visiblenodes
  has_many :gamesessions, through: :groups
  has_many :nodes

  validates :skillset_id, presence: true

  def parsexml
    @skillset = Skillset.new
    @programset = Programset.new
    @commlink = Node.new

    doc = Nokogiri::XML(uploaded_xml)

    #Parse Doc using Nokogiri! http://nokogiri.org

    @commlink.player_id = @player.id
    @commlink.programset_id = @programset.id
    @commlink.save
    @skillset.save 
    @programset.player_id = @player.id
    @programset.save
    @player.skillset_id = @skillset.id
    @player.user_id = session[:user_id]
    @player.save
    return true
  end

  def update_from(params)
    self.name = params[:name]
    self.condition = params[:condition]
    self.stun = params[:stun]
  end

  def create_from(params)
    self.update_from(params[:player])
    skillset = Skillset.new params[:skillset]
    if skillset.save
      self.skillset_id = skillset.id
    end
  end

end
