require 'rails_helper'

RSpec.describe TopsController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let(:login_user) { create(:user) }

    before do
      sign_in login_user
    end

    it "returns http success" do
      get :show, params: { id: login_user.id }
      expect(response).to have_http_status(:success)
    end
  end
end
