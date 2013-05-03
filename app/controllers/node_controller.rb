class NodeController < ApplicationController
	before_filter :authenticate_user
  def new
    @node = Node.new
    @programset = Programset.new
  end

  def create

  end

  def instance
  end

  def list
  end

  def edit
  end

  def delete
  end
end
