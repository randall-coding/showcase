class MainController < ApplicationController
  def index
      @message = Message.new
      #redirect_to ethereum_path
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
        #redirect_to root_url
      else
        #redirect_to contact_me_url
      end
  end

end
