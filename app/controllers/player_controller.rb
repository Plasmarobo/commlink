class PlayerController < ApplicationController
	before_filter :authenticate_user
	before_filter :authenticate_player, :only => [ :edit, :delete, :edit_attempt ]

  def new
    @player = Player.new
  	#Just render the new form
  end

  def create
    uploaded_xml = File.new(params[:file])
    @player = Player.new
    @player.parsexml(uploaded_xml)
  end

  def list
  	#Just render the list
  end

  def select
  	@player = Player.find_by_id params[:id]
    if @player 
      session[:player_id] = @player.id
      flash[:notice] = "Player Selected"
      flash[:color] = "valid"
      redirect_to :back
      return true
    else
      flash[:notice] = "Could not select player"
      flash[:color] = "invalid"
      redirect_to :controller => :player, :action => :list
      return false
    end
  end

  def edit
  	#Display the edit form
    @player = Player.find_by_id params[:id]
    @skillset = Skillset.find_by_id @player.skillset_id
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
