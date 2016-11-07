class CoachesController < ApplicationController

  def show
    @coach = Coach.find(params[:id])
    @practices = @coach.practices
  end

  def new
    @coach = Coach.new
  end

  def create
    @coach = Coach.new(coach_params)
    puts "saving a coach"
    puts @coach.inspect
    if @coach.save
      flash[:notice] = "Thanks for joining!"
      session[:coach_id] = @coach.id
      @coach.authenticate(params[:password])
      redirect_to [:root]
    else
      render :new
    end
  end


  private
  def coach_params
    params.require(:coach).permit(
      :name,
      :team,
      :age_group,
      :email,
      :phone,
      :password,
      :password_confirmation
    )
  end

end
