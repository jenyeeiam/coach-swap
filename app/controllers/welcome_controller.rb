class WelcomeController < ApplicationController
  helper_method :date_calculator

  def date_calculator(day)
    @date = day.strftime("%A")
  end
  
  def index

  end

  def show
    @practices = Practice.all
    @current_user = current_user
    @coach_1 = Coach.find(1)
    @schedule = IceCube::Schedule.new(Time.now, :end_time => Time.now + 30*86400) do |s|
      s.add_recurrence_rule IceCube::Rule.daily
    end

    @event = EventRecurrence.where(coach_id: 1)
  end

end
