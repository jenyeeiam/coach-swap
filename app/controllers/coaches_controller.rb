class CoachesController < ApplicationController

  def show
    @coach = Coach.find(params[:id])
    @practices = @coach.practices
  end

end
