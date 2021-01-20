require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  let(:job) { create(:job) }
  let(:login_user) { create(:user, admin: true, job: job) }
  let(:user) { create(:user, job: job) }

  before do
    sign_in login_user
  end

  describe "/admin/users" do
    it "ステータス OK が返ってくる" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "/admin/users/:id" do
    it "ステータス OK が返ってくる" do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "/admin/users/:id/edit" do
    it "ステータス OK が返ってくる" do
      get :edit, params: { id: user.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
