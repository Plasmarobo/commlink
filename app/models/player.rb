class Player < ActiveRecord::Base
	belongs_to :user
	has_many :groups
	has_many :gamesessions, through: :groups
	has_one :skillset, dependent: :destroy
  	attr_accessible :id, :user_id, :name, :programset_id, :skillset_id, :condition, :stun
	def parsexml
  	@skillset = Skillset.new
  	@programset = Programset.new
  	@commlink = Node.new

  	doc = Nokogiri::XML(uploaded_xml)

    #Parse Doc using Nokogiri! http://nokogiri.org

  	@commlink.player_id = @player.id
  	@commlink.programset_id = @programset.id
  	@commlink.save
  	@skillset.player_id = @player.id
  	@skillset.save 
  	@programset.player_id = @player.id
  	@programset.save
	  @player.skillset_id = @skillset.id
	  @player.programset_id = @programset.id
    @player.user_id = session[:user_id]
  	@player.save
  	return true
  end
end