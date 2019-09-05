class MainController < ApplicationController
  def index
      @message = Message.new
  end

  def contact_send
      message = Message.new
      message.body = params[:message][:body]
      message.email  = params[:message][:email]
      message.from  = params[:message][:from]

      if (message.save)
        MyMailer.contact_me(message).deliver_later
        message.destroy
        respond_to do |format|
          format.js
        end
        #stay at root
      else
        #redirect_to contact_me_url
      end
  end

  def aboutme
    render layout: false
  end

  def portfolio
    render '_portfolio', layout: false
  end
end
