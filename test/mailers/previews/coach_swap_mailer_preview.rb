# Preview all emails at http://localhost:3000/rails/mailers/coach_swap_mailer
class CoachSwapMailerPreview < ActionMailer::Preview
  def coach_swap_mail_preview
    CoachSwapMailer.confirmation_email_guest(Coach.first, Coach.last, Practice.first)
  end
end
