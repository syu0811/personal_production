require 'rails_helper'

RSpec.describe Admin::StudentController, type: :controller do
  let(:login_user) { create(:user, admin: true) }
  let(:user) { create(:user) }
  let(:student) { create(:student) }

  before do
    sign_in login_user
  end

  describe "/admin/student" do
    it "ステータス OK が返ってくる" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "/admin/student/new" do
    it "ステータス OK が返ってくる" do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe "/admin/student/:id/edit" do
    it "ステータス OK が返ってくる" do
      get :edit, params: { id: student.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
