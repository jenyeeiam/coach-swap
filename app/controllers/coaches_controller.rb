class CoachesController < ApplicationController

  def show
    @coach = Coach.find(params[:id])
    @practices = @coach.practices.where("date >= ?", Date.today).order(:date)
    @my_practices = Practice.where("guest_coach_id = ? AND date >= ?", @coach.id, Date.today).order(:date)
    if @my_practices.class == Practice
      @my_practices = [@my_practices]
    end
  end

  def new
    @coach = Coach.new
  end

  def create
    @coach = Coach.new(coach_params)
    @coach.user_id = current_user.id
    @coach.email = current_user.email
    if @coach.save
      flash[:notice] = "Great job on creating a profile! Next step is to join another team's practice or host a practice so other coaches can join."
      redirect_to "/coaches/#{@coach.id}/practices"
    elsif !@coach.valid?
      flash[:notice] = "All fields are required. We strive for a transparent platform for all coaches!"
      render :new
    end
  end

  def edit
    @coach = current_coach
  end

  def update
    coach = current_coach
    coach.update! update_coach_params
    redirect_to "/coaches/#{coach.id}"
  end


  private
  def coach_params
    params.require(:coach).permit(
      :avatar,
      :name,
      :team,
      :age_group,
      :state,
      :phone
    )
  end

  def update_coach_params
    params.require(:coach).permit(
      :avatar,
      :name,
      :team,
      :age_group,
      :state,
      :phone
    )
  end

end
