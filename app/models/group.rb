class Group < ApplicationRecord
  belongs_to :user
  has_many :group_number_students, dependent: :destroy

  MAX_YEAR = 6
  validates :school_year, numericality: { greater_than: 0, less_than: MAX_YEAR + 1 }, presence: true
  validates :number, presence: true, uniqueness: { scope: :school_year }
  validates :user_id, presence: true

  def view_group_name
    "#{school_year}年#{number}組"
  end
end
