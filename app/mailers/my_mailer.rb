class MyMailer < ApplicationMailer
  default from: "randall_abi@outlook.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.my_mailer.send.subject
  #
  def contact_me
    @greeting = "Hi"

    #mail to: "randall_abi@outlook.com", subject: "email from Showcase"
    mail to: "randall_abi@outlook.com"
  end
end
