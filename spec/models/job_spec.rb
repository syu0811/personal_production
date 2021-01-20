require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'Validation' do
    context '正常系' do
      it "成功する" do
        job = build(:job)
        expect(job).to be_valid
      end
    end

    context '異常系' do
      it 'nameが重複している場合' do
        name = "test_name"
        create(:job, name: name)
        job = build(:job, name: name)
        job.valid?
        expect(job.errors[:name]).to include("はすでに存在します")
      end

      it 'nameが空の場合' do
        job = build(:job, name: nil)
        job.valid?
        expect(job.errors[:name]).to include("を入力してください")
      end

      it "nameの文字数が10文字より多い場合" do
        job = build(:job, name: 'a' * 11)
        job.valid?
        expect(job.errors[:name]).to include("は10文字以内で入力してください")
      end
    end
  end
end
