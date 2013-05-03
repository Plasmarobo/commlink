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
	  @player.skillset_id = @skillset.id
	  @player.programset_id = @programset.id
    @player.user_id = session[:user_id]
  	@player.save
  	redirect_to :action => :list
  end

  def list
  	#Just render the list
  end

  def select
  	@player = Players.find params[:id]
    if @player 
      session[:player_id] = @player.id
      return true
    else
      render "list"
      return false
    end
  end

  def edit
  	#Display the edit form
  end

  def edit_attempt
  	render "edit"
  end

  def delete
    #Display delete page
  end

  def delete_attempt
    Players.delete Players.find params[:id]
  end
end
