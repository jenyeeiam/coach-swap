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
    @coach = Coach.find(params[:coach_id])
    @practice = Practice.find(params[:id])
  end

  def update
    practice = Practice.find(params[:id])
    host_coach = Coach.find(practice.coach_id)
    if params[:edit_practice]
      practice.update! update_practice_params
      redirect_to "/coaches/#{params[:coach_id]}"
    elsif params[:cancel_rsvp]
      CancelMailer.cancellation_email(host_coach, practice).deliver_later
      practice.update! guest_coach_id: nil
      flash[:notice] = "Sorry you're not able to make this practice. We've notified #{host_coach.name} for you"
      redirect_to coach_practices_path
    else
      guest_coach = Coach.find(params[:guest_coach_id])
    practice.guest_coach_id = params[:guest_coach_id]

    if practice.save
      GuestMailer.confirmation_email_guest(guest_coach, host_coach, practice).deliver_later
      HostMailer.confirmation_email_host(guest_coach, host_coach, practice).deliver_later
      flash[:notice] = "You just joined a practice! Check your inbox for your confirmation email"
      redirect_to coach_practices_path
    else
      redirect_to coach_practices_path, error: order.errors.full_messages.first
    end

    end
  end

  def new
    @coach = Coach.find(params[:coach_id])
    @practice = @coach.practices.new
  end

  def create
    @coach = Coach.find(params[:coach_id])
    if params["end_date"].blank?
      @practice = @coach.practices.new practice_params(params[:practice])
      @practice.date = params[:start_date].to_date
      @practice.team_name = @coach[:team]
      @practice.state = @coach[:state]
      @practice.age_group = @coach.age_group
      if @practice.save && params[:add_practice]
        flash[:notice] = "Great work. Add another practice!"
        render :new
      elsif @practice.save
        redirect_to "/coaches/#{@coach.id}/practices"
      else
        flash[:notice] = "All fields are required."
        byebug
        render :new
      end
    else
      date_range = (params[:start_date].to_date)..(params[:end_date].to_date)
      practice_dates = date_range.select {|d| [params[:start_date].to_date.strftime("%u").to_i].include?(d.wday)}
      practice_dates.each do |date|
        @practice = @coach.practices.new practice_params(params[:practice])
        @practice.date = date
        @practice.team_name = @coach[:team]
        @practice.state = @coach[:state]
        @practice.age_group = @coach.age_group
        if !@practice.valid?
          flash[:notice] = "Something's terribly wrong"
          render :new_coach_practice_path
        end
        @practice.save
      end
      if params[:add_practice]
        flash[:notice] = "Great work! Add another practice!"
        render :new
      else
        redirect_to "/coaches/#{@coach.id}/practices"
      end
    end

  end

  def destroy
    practice = Practice.find(params[:id])
    practice.delete
    redirect_to "/coaches/#{current_user.id}"
  end

  def practice_params(practice)
    practice.permit(
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

  def update_practice_params
    params.require(:practice).permit(
      :time,
      :duration,
      :street,
      :city,
      :zipcode,
      :date
    )
  end

  def search_params
    params.permit(:age_group, :city, :zipcode, :state).transform_values do |value|
      value.empty? ? nil : value
    end
  end

end
