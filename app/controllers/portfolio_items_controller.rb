class PortfolioItemsController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!, except: [:zoomed_item]
  before_action :require_admin, except: [:zoomed_item]

  def new
    @portfolio_item = PortfolioItem.new
  end

  def create
    @new_item = PortfolioItem.new(
      css_class: params[:portfolio_item][:css_class],
      title: params[:portfolio_item][:title],
      logo: params[:portfolio_item][:logo],
      url: params[:portfolio_item][:url],
      image_url: params[:portfolio_item][:image_url],
      description: params[:portfolio_item][:description],
    )
    if @new_item.save!
      render plain: "created ok"
    else
      render plain: "no good: #{@new_item.errors.full_messages}"
    end

  end

  def zoomed_item
    item = PortfolioItem.find(params[:id])
    render partial: 'zoomed_item', layout: false, locals:{item:item}
  end
end
