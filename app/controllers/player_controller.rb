class PlayerController < ApplicationController
	before_filter :authenticate_user
	before_filter :authenticate_player, :only => [ :edit, :delete, :edit_attempt ]
  def new
  	#Just render the new form
  end

  def parsexml
  	uploaded_xml = File.new(params[:file])
  	@player = Player.new
  	@skillset = Skillset.new
  	@programset = Programset.new
  	@commlink = Node.new

  	#PARSE XML HERE

  	@commlink.player_id = @player.id
  	@commlink.programset_id = @programset.id
  	@commlink.save
  	@skillset.player_id = @player.id
  	@skillset.save 
  	@programset.player_id = @player.id
  	@programset.save
  	@player.node_id = @commlink.id
	#@player.skillset_id = @skillset.id
	#@player.programset_id = @programset.id
  	@player.save
  	redirect_to :action => :list
  end

  def list
  	#Just render the list
  end

  def select
  	session[:player_id] = Players.find_by_name params[:name].id
  end

  def edit
  	#Display the edit form
  end

  def edit_attempt
  	render "edit"
  end

  def delete
  end
end
