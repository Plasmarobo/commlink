class RulesController < ApplicationController
  def new
  	@programset = Programset.new
  	@program_names = @programset.attribute_names
  end

  def upload
  end

  def download
  end

  def move
  end
end
