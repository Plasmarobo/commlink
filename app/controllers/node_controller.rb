class NodeController < ApplicationController
	before_filter :authenticate_user

  def new
    @node = Node.new
    @programset = Programset.new
    @programset.zero
    @program_names = @programset.attribute_names
  end

  def create
    @node = Node.new
    @programset = Programset.new
    if !session[:player_id] and !params[:gm]
      flash[:notice] = "Node must be either player or gm!"
      flash[:color] = "invalid"
      redirect_to :back
      return false
    end
    @node.desc = params[:desc]
    @node.firewall = params[:firewall]
    @node.gm_id  = params[:gm] ? session[:user_id] : nil
    @node.name = params[:name]
    @node.pilot = params[:pilot]
    @node.player_id = params[:gm] ? nil : session[:player_id]
    @node.programset_id = @programset.id
    @node.response = params[:response]
    @node.signal = params[:signal]
    @node.system = params[:system]
 
    @programset.create params

    if @programset.save
      if @node.save
        flash[:notice] = "Successfully created node"
        flash[:color] = "valid"
        redirect_to :controller => :gamesession, :action => :manage
        return true
      else
        @programset.destroy
        flash[:notice] = "Could not create node"
        flash[:color] = "invalid"
        redirect_to :back
        return false
      end
    else
      flash[:notice] = "Could not create programset"
      flash[:color] = "valid"
      redirect_to :back
      return false
    end

  end

  def list
    @user = User.find_by_id session[:user_id]
    @player = Player.find_by_id session[:player_id]
    if !@player
      redirect_to :controller => :player, :action => :select
    end
  end

  def manage
    @user = User.find_by_id session[:user_id]
  end

  def edit
    #Just render a nice chunk
    @node = Node.find_by_id params[:id]
  end



  def edit_attempt
    @node
    @programset
  end

  def delete
    #Oh noes!
  end

  def attempt_delete
  end
end
