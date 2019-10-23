require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
  let(:params){ {} }

  before do
    create(:admin)
  end

  describe "GET #sign_in page" do
    it "returns http success" do
      get :sign_in
      expect(response).to have_http_status(:success)
    end
 end

  describe "POST #create_session" do
    before do
      params[:username] = "Admin"
      params[:password] = "Password"
      Admin.any_instance.stub :regenerate_token
    end

    describe "successful login" do
      before do
        post :create_session, params: params
      end
      specify{ expect(response).to have_http_status(:redirect)}
      specify{ expect(response.location).to eq(portfolio_item_url) }
      specify{ expect(assigns[:desired_admin]).to have_received(:regenerate_token)}
    end

    describe "failed login" do
      before do
        params[:password] = "Wrong_Password"
        post :create_session, params: params
      end
      specify{ expect(response).to have_http_status(:redirect)}
      specify{ expect(response.location).to eq(admin_sign_in_url) }
    end
  end
end #end spec
