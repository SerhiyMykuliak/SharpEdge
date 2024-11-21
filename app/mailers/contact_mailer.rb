class ContactMailer < ApplicationMailer
  default to: 'owner@example.com'

  def contact_email(email, message)
    @email = email
    @message = message

    mail(from: @email, subject: "Message")
  end 

end
