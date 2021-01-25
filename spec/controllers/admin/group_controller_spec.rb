require 'rails_helper'

RSpec.describe Admin::GroupController, type: :controller do
  let(:login_user) { create(:user, admin: true) }
  let(:user) { create(:user) }
  let(:group) { create(:group, user: user) }

  before do
    sign_in login_user
  end

  describe "/admin/group" do
    it "ステータス OK が返ってくる" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "/admin/group/new" do
    it "ステータス OK が返ってくる" do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe "/admin/group/:id/edit" do
    it "ステータス OK が返ってくる" do
      get :edit, params: { id: group.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
