class PracticesController < ApplicationController
  helper_method :date_calculator

  def date_calculator(day)
    @date = day.strftime("%A")
  end

  def index
    @practices = Practice.all
    @current_user = current_user
    @coach_1 = Coach.find(1)
    @schedule = IceCube::Schedule.new(Time.now, :end_time => Time.now + 30*86400) do |s|
      s.add_recurrence_rule IceCube::Rule.daily
    end

    @event = EventRecurrence.where(coach_id: 1)
  end

  def new
    @coach = Coach.find(params[:coach_id])
    @practice = @coach.practices.new
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
