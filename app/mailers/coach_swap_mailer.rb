class CoachSwapMailer < ApplicationMailer
  default from: 'no-reply@coachswap.com'

  def confirmation_email_guest(guest_coach, host_coach, practice)
    @guest_coach = guest_coach
    @host_coach = host_coach
    @practice = practice
    mail(
      to: @guest_coach.email,
      subject: "Confirmation RSVP"
    )
  end

  # def confirmation_email_host(guest_coach, host_coach, practice)
  #   @guest_coach = guest_coach
  #   @host_coach = host_coach
  #   @practice = practice
  #   mail(
  #     to: @host_coach.email,
  #     subject: "You have a guest coach for your practice on #{@practice[:date].strftime('%A %B %d')}!"
  #   )
  # end

end
