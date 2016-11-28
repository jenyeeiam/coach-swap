class PracticesController < ApplicationController
  helper_method :date_calculator

  def date_calculator(day)
    @date = day.strftime('%A %B %d')
  end

  def index
    @coach = Coach.find(current_user[:id])
    @my_practices = @coach.practices
    @all_coaches = Coach.all
    # practices + filters
    @practices = Practice.all
    @practices = @practices.filter_by_age_group(params[:age_group]) if search_params[:age_group]
    @practices = @practices.filter_by_city(params[:city]) if search_params[:city]
    @practices = @practices.filter_by_zipcode(params[:zipcode]) if search_params[:zipcode]
    @practices = @practices.filter_by_state(params[:state]) if search_params[:state]
    if @practices.blank? || @practices.empty?
      flash[:error] = 'Sorry no practices found'
      redirect_to coach_practices_path
    end
  end

  def edit
    @practice = Practice.find(params[:id])
  end

  def update
    guest_coach = Coach.find(params[:guest_coach_id])
    practice = Practice.find(params[:id])
    practice.guest_coach_id = params[:guest_coach_id]
    host_coach = Coach.find(practice.coach_id)

    if practice.save
      CoachSwapMailer.confirmation_email_guest(guest_coach, host_coach, practice).deliver_later
      HostMailer.confirmation_email_host(guest_coach, host_coach, practice).deliver_later

      redirect_to :root
    else
      redirect_to coach_practice_path, error: order.errors.full_messages.first
    end

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
      if practice[:time] != '' || practice[:duration] != '' || practice[:street] != '' || practice[:city] != '' || practice[:zipcode] != ''
        # new_practice = @coach.practices.new(practice_params(practice))
        # new_practice.start_date = Date.today
        # new_practice.team_name = @coach.team
        new_practice = @coach.event_recurrences.new(events_params(practice))
        new_practice.dates.each do |i|
          prac = @coach.practices.new(practice_params(practice))
          prac.date = i
          prac.team_name = @coach.team
          prac.age_group = @coach.age_group
          prac.state = @coach.state
          prac.save
        end

        # new_practice.save
      end
    end
    redirect_to coach_practices_path

  end

  def practice_params(practice)
    practice.permit(
      :day_of_week,
      :time,
      :duration,
      :street,
      :city,
      :zipcode
    )
  end

  def events_params(practice)
    practice.permit(
      :day_of_week,
      :end_date
    )
  end

  def search_params
    params.permit(:age_group, :city, :zipcode, :state).transform_values do |value|
      value.empty? ? nil : value
    end
  end

end
