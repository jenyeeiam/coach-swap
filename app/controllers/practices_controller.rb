class PracticesController < ApplicationController
  helper_method :date_calculator

  def date_calculator(day)
    @date = day.strftime("%A")
  end

  def index

  end

  def new
    @coach = Coach.find(params[:coach_id])
    @practice = @coach.practices.new

    # @coach = Coach.find(1)

    @practices = []
    7.times do
      @practices << Coach.find(params[:coach_id]).practices.new
    end

  end

  def create
    byebug
    # params["practices"].each do |practice|
    #   @coach = Coach.find(1)
    #   byebug
    #   if practice["day_of_week"] != ''
    #     @coach.practices.create(practice_params(practice))
    #   end
    # end
    #
    # def practice_params(my_params)
    #   my_params.permit(:day_of_week, :time, :location)
    # end


  end


end
