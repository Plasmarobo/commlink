class NodeTemplatesController < ApplicationController
  # GET /node_templates
  # GET /node_templates.json
  def index
    @node_templates = NodeTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @node_templates }
    end
  end

  # GET /node_templates/1
  # GET /node_templates/1.json
  def show
    @node_template = NodeTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @node_template }
    end
  end

  # GET /node_templates/new
  # GET /node_templates/new.json
  def new
    @node_template = NodeTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @node_template }
    end
  end

  # GET /node_templates/1/edit
  def edit
    @node_template = NodeTemplate.find(params[:id])
  end

  # POST /node_templates
  # POST /node_templates.json
  def create
    @node_template = NodeTemplate.new(params[:node_template])

    respond_to do |format|
      if @node_template.save
        format.html { redirect_to @node_template, notice: 'Node template was successfully created.' }
        format.json { render json: @node_template, status: :created, location: @node_template }
      else
        format.html { render action: "new" }
        format.json { render json: @node_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /node_templates/1
  # PUT /node_templates/1.json
  def update
    @node_template = NodeTemplate.find(params[:id])

    respond_to do |format|
      if @node_template.update_attributes(params[:node_template])
        format.html { redirect_to @node_template, notice: 'Node template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @node_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /node_templates/1
  # DELETE /node_templates/1.json
  def destroy
    @node_template = NodeTemplate.find(params[:id])
    @node_template.destroy

    respond_to do |format|
      format.html { redirect_to node_templates_url }
      format.json { head :no_content }
    end
  end
end
