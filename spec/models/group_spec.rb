require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Validation' do
    let(:user) { create(:user) }

    context '正常系' do
      it "成功する" do
        group = build(:group, user: user)
        expect(group).to be_valid
      end
    end

    context '異常系' do
      it 'school_yearとnumberが重複している場合' do
        school_year = 1
        number = 2
        create(:group, school_year: school_year, number: number)
        group = build(:group, school_year: school_year, number: number)
        group.valid?
        expect(group.errors[:number]).to include("はすでに存在します")
      end

      it 'school_yearが空の場合' do
        group = build(:group, school_year: nil)
        group.valid?
        expect(group.errors[:school_year]).to include("を入力してください")
      end

      it 'numberが空の場合' do
        group = build(:group, number: nil)
        group.valid?
        expect(group.errors[:number]).to include("を入力してください")
      end

      it 'user_idが空の場合' do
        group = build(:group, user: nil)
        group.valid?
        expect(group.errors[:user_id]).to include("を入力してください")
      end
    end
  end
end
