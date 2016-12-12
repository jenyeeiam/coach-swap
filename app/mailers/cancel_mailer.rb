class CancelMailer < ApplicationMailer
  default from: 'no-reply@coachswap.com'

  def cancellation_email(host_coach, practice)
    @guest_coach = Coach.find(practice[:guest_coach_id])
    @host_coach = host_coach
    @practice = practice
    mail(
      to: @host_coach.email,
      subject: "#{@guest_coach[:name]} will not be attending your practice on #{@practice[:date].strftime('%A %B %d')}"
    )
  end
end
