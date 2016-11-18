# Preview all emails at http://localhost:3000/rails/mailers/host_mailer
class HostMailerPreview < ActionMailer::Preview
  def host_mail_preview
    HostMailer.confirmation_email_host(Coach.first, Coach.last, Practice.first)
  end
end
