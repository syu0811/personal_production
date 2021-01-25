require 'rails_helper'

RSpec.describe Admin::JobController, type: :controller do
  let(:login_user) { create(:user, admin: true) }
  let(:user) { create(:user) }
  let(:job) { create(:job) }

  before do
    sign_in login_user
  end

  describe "/admin/job" do
    it "ステータス OK が返ってくる" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "/admin/job/new" do
    it "ステータス OK が返ってくる" do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe "/admin/job/:id/edit" do
    it "ステータス OK が返ってくる" do
      get :edit, params: { id: job.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
