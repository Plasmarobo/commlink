class FriendsController < ApplicationController
  before_filter :authenticate_user
  # GET /friends
  # GET /friends.json
  def index
    @friends = Friend.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @friends }
    end
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
    @friend = Friend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @friend }
    end
  end

  # GET /friends/new
  # GET /friends/new.json
  def new
    @friend = Friend.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @friend }
    end
  end

  # GET /friends/1/edit
  def edit
    @friend = Friend.find(params[:id])
  end

  # POST /friends
  # POST /friends.json
  def create
    @friend = Friend.new
    user = User.find_by_id params[:friend][:username]
    @friend.friend_id = user.id
    @friend.user_id = session[:user_id]
    me = User.find_by_id session[:user_id]
    if user
      if user.id == @friend.user_id
        flash[:notice] = "Nice try, you can't friend yourself"
        flash[:color] = "invalid"
        success = false
      else
        @friend.friend_id = user.id
        if me.friends.include? user
          flash[:notice] = "You are already friends with #{user.username}"
          flash[:color] = "invalid"
          success = false
        else
          success = @friend.save
        end
      end
    end

    success = @friends.save
    respond_to do |format|
      if success
        format.html { redirect_to @friend, notice: 'Friend was successfully created.' }
        format.json { render json: @friend, status: :created, location: @friend }
      else
        format.html { render action: "new" }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /friends/1
  # PUT /friends/1.json
  def update
    @friend = Friend.find(params[:id])

    respond_to do |format|
      if @friend.update_attributes(params[:friend])
        format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to friends_url }
      format.json { head :no_content }
    end
  end
end
