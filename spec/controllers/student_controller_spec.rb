require 'rails_helper'

RSpec.describe StudentController, type: :controller do
  let!(:login_user) { create(:user) }

  before do
    sign_in login_user
  end

  describe "/student/" do
    it "ステータス OK が返ってくる" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "/student/:id/edit" do
    let(:student) { create(:student) }

    it "ステータス OK が返ってくる" do
      get :edit, params: { id: student.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
