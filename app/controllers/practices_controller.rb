class PracticesController < ApplicationController
  helper_method :date_calculator

  def date_calculator(day)
    @date = day.strftime("%A")
  end

  def index
    @practices = Practice.all
    @current_user = current_user
    puts "current"
    puts @current_user.inspect
    @coach_1 = Coach.find(1)
  end

  def create
    @coach = Coach.find(params[:coach_id])
    @practice = @coach.practices.new(practice_params)
  end

  private
    def practice_params
      params.require(:practice).permit(
        :location,
        :time
      )
    end

end
