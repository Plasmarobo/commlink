class VisiblenodesController < ApplicationController
  # GET /visiblenodes
  # GET /visiblenodes.json
  def index
    @visiblenodes = Visiblenode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @visiblenodes }
    end
  end

  # GET /visiblenodes/1
  # GET /visiblenodes/1.json
  def show
    @visiblenode = Visiblenode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @visiblenode }
    end
  end

  # GET /visiblenodes/new
  # GET /visiblenodes/new.json
  def new
    @visiblenode = Visiblenode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @visiblenode }
    end
  end

  # GET /visiblenodes/1/edit
  def edit
    @visiblenode = Visiblenode.find(params[:id])
  end

  # POST /visiblenodes
  # POST /visiblenodes.json
  def create
    @visiblenode = Visiblenode.new(params[:visiblenode])

    respond_to do |format|
      if @visiblenode.save
        format.html { redirect_to @visiblenode, notice: 'Visiblenode was successfully created.' }
        format.json { render json: @visiblenode, status: :created, location: @visiblenode }
      else
        format.html { render action: "new" }
        format.json { render json: @visiblenode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /visiblenodes/1
  # PUT /visiblenodes/1.json
  def update
    @visiblenode = Visiblenode.find(params[:id])

    respond_to do |format|
      if @visiblenode.update_attributes(params[:visiblenode])
        format.html { redirect_to @visiblenode, notice: 'Visiblenode was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @visiblenode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visiblenodes/1
  # DELETE /visiblenodes/1.json
  def destroy
    @visiblenode = Visiblenode.find(params[:id])
    @visiblenode.destroy

    respond_to do |format|
      format.html { redirect_to visiblenodes_url }
      format.json { head :no_content }
    end
  end
end
