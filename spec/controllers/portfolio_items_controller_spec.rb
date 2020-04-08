require 'rails_helper'

RSpec.describe PortfolioItemsController, type: :controller do
  let(:params) { {} }

  before do
    create(:admin)
  end

  describe "GET #new" do
    it "returns http success if signed in" do
      # Sign in
      session[:user_token] = "token"
      # Try
      get :new
      expect(response).to have_http_status(:success)
    end

    it "returns error if not signed in" do
      expect{(get :new) }.to raise_error(StandardError)
    end

  end

  describe "GET #create" do
    before do
      params[:portfolio_item] = {}
      params[:portfolio_item][:css_class] = "rails"
      params[:portfolio_item][:title] = "Test title"
      params[:portfolio_item][:logo] = "rails"
      params[:portfolio_item][:url] = "www.google.com"
      params[:portfolio_item][:image_url] = "image.png"
      params[:portfolio_item][:description] = "valid description"
    end

    it "returns http success" do
      # Sign in
      session[:user_token] = "token"
      # Try
      get :create, params:params
      expect(response).to have_http_status(:success)
    end

    it "returns error if not signed in" do
      expect{ (get :create, params:params) }.to raise_error(StandardError)
    end

  end
end
