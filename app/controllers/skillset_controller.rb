class SkillsetController < ApplicationController
  def new
  	@skillset = Skillset.new
  end

  def edit
  	#Just render the form
  end

  def delete
  	#Just render the form
  end

  def delete_attempt
  	Skillset.delete Skillset.find_by_id params[:id]
  end

end
