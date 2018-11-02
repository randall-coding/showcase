class MyMailer < ApplicationMailer
  default from: "randall_abi@outlook.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.my_mailer.send.subject
  #
  def contact_me(message)
    @greeting = "Hi"
    @body = message.body
    @email = message.email
    @from = message.from
    mail to: 'randallcoding@protonmail.com', subject: 'Email from Showcase'
    #mail to: "randall_abi@outlook.com", subject: "Email from Showcase"
  end
end
