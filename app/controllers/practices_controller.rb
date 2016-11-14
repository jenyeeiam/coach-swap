class PracticesController < ApplicationController
  helper_method :date_calculator

  def date_calculator(day)
    @date = day.strftime('%A %B %d')
  end

  def index
    @coach = Coach.find(current_user[:id])
    @my_practices = @coach.practices
    @all_practices = Practice.all
  end

  def new
    @coach = Coach.find(params[:coach_id])
    @practice = @coach.practices.new

    @practices = []
    7.times do
      @practices << Coach.find(params[:coach_id]).practices.new
    end

  end

  def create
    @coach = Coach.find(current_user[:id])
    params["practices"].each do |practice|
      if practice[:time] != '' || practice[:duration] != '' || practice[:location] != ''
        # new_practice = @coach.practices.new(practice_params(practice))
        # new_practice.start_date = Date.today
        # new_practice.team_name = @coach.team
        new_practice = @coach.event_recurrences.new(events_params(practice))
        new_practice.dates.each do |i|
          prac = @coach.practices.new(practice_params(practice))
          prac.date = i
          prac.team_name = @coach.team
          prac.save
        end

        # new_practice.save
      end
    end
    redirect_to practices_path

  end

  def practice_params(practice)
    practice.permit(
      :day_of_week,
      :time,
      :duration,
      :location
    )
  end

  def events_params(practice)
    practice.permit(
      :day_of_week,
      :end_date
    )
  end

end
