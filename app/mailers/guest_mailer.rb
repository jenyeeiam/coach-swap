class GuestMailer < ApplicationMailer
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

end
