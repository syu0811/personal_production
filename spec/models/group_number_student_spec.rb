require 'rails_helper'

RSpec.describe GroupNumberStudent, type: :model do
  describe 'Validation' do
    let(:group) { create(:group) }
    let(:student) { create(:student) }

    context '正常系' do
      it "成功する" do
        group_number_student = build(:group_number_student, group: group, student: student)
        expect(group_number_student).to be_valid
      end
    end

    context '異常系' do
      it "group_idが無ければ失敗する" do
        group_number_student = build(:group_number_student, group_id: nil)
        group_number_student.valid?
        expect(group_number_student.errors[:group_id]).to include("を入力してください")
      end

      it "student_idが無ければ失敗する" do
        group_number_student = build(:group_number_student, student_id: nil)
        group_number_student.valid?
        expect(group_number_student.errors[:student_id]).to include("を入力してください")
      end

      it "numberが無ければ失敗する" do
        group_number_student = build(:group_number_student, number: nil)
        group_number_student.valid?
        expect(group_number_student.errors[:number]).to include("を入力してください")
      end

      it 'group_idとstudent_idとnumberが重複している場合' do
        create(:group_number_student, group: group, student: student)
        group_number_student = build(:group_number_student, group: group, student: student)
        group_number_student.valid?
        expect(group_number_student.errors[:student_id]).to include("はすでに存在します")
      end
    end
  end
end
