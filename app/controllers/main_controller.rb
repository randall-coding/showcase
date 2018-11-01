class MainController < ApplicationController
  def index
     MyMailer.contact_me.deliver_later
  end

  def contact
      #MyMailer.send.deliver_later
  end

end
