class Student < ApplicationRecord
  belongs_to :group

  # 名前は全角平仮名、漢字（鬼車）のみ許可
  VALID_NAME_REGEX = /\A(?:\p{Hiragana}|[ー－]|[一-龠々])+\z/.freeze
  validates :firstname, presence: true, format: { with: VALID_NAME_REGEX }
  validates :lastname, presence: true, format: { with: VALID_NAME_REGEX }
  validates :birthdate, presence: true
  validate :birthdate_cannot_be_in_the_future
  validates :number, presence: true
  validates :group_id, presence: true, uniqueness: { scope: :number }

  def birthdate_cannot_be_in_the_future
    # 生年月日が入力済かつ未来日ではない
    errors.add(:birthdate, :birthdate_cannot_be_in_the_future) if birthdate.present? && birthdate.future?
  end
end
