require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'Validation' do
    context '正常系' do
      it "成功する" do
        student = build(:student)
        expect(student).to be_valid
      end
    end

    context "異常系" do
      it 'firstnameが空の場合' do
        student = build(:student, firstname: nil)
        student.valid?
        expect(student.errors[:firstname]).to include("を入力してください")
      end

      it 'firstnameにカタカナが含まれている場合' do
        student = build(:student, firstname: 'カタカナ')
        student.valid?
        expect(student.errors[:firstname]).to include("は不正な値です")
      end

      it 'firstnameにアルファベットが含まれている場合' do
        student = build(:student, firstname: 'name')
        student.valid?
        expect(student.errors[:firstname]).to include("は不正な値です")
      end

      it 'lastnameが空の場合' do
        student = build(:student, lastname: nil)
        student.valid?
        expect(student.errors[:lastname]).to include("を入力してください")
      end

      it 'lastnameにカタカナが含まれている場合' do
        student = build(:student, lastname: 'カタカナ')
        student.valid?
        expect(student.errors[:lastname]).to include("は不正な値です")
      end

      it 'lastnameにアルファベットが含まれている場合' do
        student = build(:student, lastname: 'name')
        student.valid?
        expect(student.errors[:lastname]).to include("は不正な値です")
      end

      it "birthdateが空の場合" do
        student = build(:student, birthdate: nil)
        student.valid?
        expect(student.errors[:birthdate]).to include("を入力してください")
      end

      it "birthdateの日付が未来の場合" do
        student = build(:student, birthdate: 1.day.since)
        student.valid?
        expect(student.errors[:birthdate]).to include("は正しい範囲で設定してください")
      end
    end
  end
end
