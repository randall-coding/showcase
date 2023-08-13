class MainController < ApplicationController
  layout 'homepage'
  caches_page [:index, :portfolio] unless Rails.env.development?

  def index
      @portfolio_items = PortfolioItem.all
      @message = Message.new
  end

  def contact_send
      message = Message.new
      message.body = params[:message][:body]
      message.email  = params[:message][:email]
      message.from  = params[:message][:from]

      if (message.save)
        MyMailer.contact_me(message).deliver_now!
        respond_to do |format|
          format.js
        end
      else
        Rails.logger.error {'Error sending and saving message'}
      end

    rescue => e 
      Rails.logger.error {'Error sending and saving message'}
      Rails.logger.error {e}
      Rails.logger.error {e.backtrace.join("\n")}
      respond_to do |format|
        format.js { render js: "$('div.contact_window').css('display','none');
        $('div.mask').css('display','none');
        alert('Problem sending e-mail');" }
      end
  end

  def aboutme
    render '_aboutme', layout: false
  end

  def portfolio
    @portfolio_items = PortfolioItem.all
    render '_portfolio', layout: false
  end
end
