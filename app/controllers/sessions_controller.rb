class SessionsController < ApplicationController

  def create
    coach = Coach.find_by email: (params[:email])
    if coach = Coach.authenticate_with_credentials(params[:email], params[:password])
      session[:coach_id] = coach.id
      redirect_to [:root], notice: "Welcome #{coach.name}"
    else
      redirect_to login_path, notice: "Try again"
    end
  end

  def destroy
    session[:coach_id] = nil
    flash[:notice] = "Successfully logged out"
    redirect_to root_path
  end

end
