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
  	redirect_to :action => :list
  end

  def list
  	#Just render the list
  end

  def select
  	@player = Player.find_by_id params[:id]
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
    @player = Player.find_by_id params[:id]
    @skillset = Skillset.find_by_id @player.skillset_id
    @programset = Programset.find_by_id (Node.find_by_player_id @player.id).first.programset_id
    #@programset = Programsets.find_by_id @player.programset_id
  end

  def edit_attempt
      flash[:notice] = "Update Successful"
      flash[:color] = "valid"
    if !@player.save
      flash[:notice] = "Could not update User"
      flash[:color] = "invalid"
      render "edit"
      return false
    end
    if !@skillset.save
      flash[:notice] = "Could not update Skills"
      flash[:color] = "invalid"
      render "edit"
      return false
    end
    if !@programset.save
      flash[:notice] = "Could not update Programs"
      flash[:color] = "invalid"
      render "edit"
      return false
    end
      redirect_to :action => :list
  end

  def delete
    #Display delete page
  end

  def delete_attempt
    Player.delete Player.find_by_id params[:id]
  end
end
