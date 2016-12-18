class WelcomeController < ApplicationController
  helper_method :date_calculator

  def date_calculator(day)
    @date = day.strftime("%A")
  end

  def get_days(event_recurrences)
    days = []
    event_recurrences.each do |i|
      days.push i.on
    end
    days
  end

  def index

  end

  def show
    @practices = Practice.all
    @current_user = current_user
    check_for_coach
  end

end
