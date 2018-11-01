class MainController < ApplicationController
  def index

  end

  def contact
      @message = Message.new
  end

  def contact_send
      message = Message.new
      message.body = params[:message][:body]
      message.email  = params[:message][:email]
      message.from  = params[:message][:from]
      puts "\n\n**** How is my message?: Message: #{params[:message]}  Body: #{params[:message][:body]} Email: #{message.email} \
                                        From: #{message.from}"
      if (message.save)
        MyMailer.contact_me(message).deliver_later
        message.destroy
        redirect_to root_url
      else
        redirect_to contact_me_url
      end
  end

end
