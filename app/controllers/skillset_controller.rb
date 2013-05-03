class SkillsetController < ApplicationController
  def new
  	@skillset = Skillset.new
  end

  def edit
  	#Just render the form
  end

  def delete
  end

end
