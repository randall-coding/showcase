class MyMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #   en.my_mailer.send.subject
  #
  def contact_me(message)
    @greeting = "Hi"
    @body = message.body
    @email = message.email
    @from = message.from
    mail to: Rails.application.credentials.receiver_email, subject: 'Email from Showcase'
  end
end