class GroupNumberStudent < ApplicationRecord
  belongs_to :group
  belongs_to :student

  validates :group_id, presence: true
  validates :student_id, presence: true, uniqueness: true
  validates :number, presence: true
end
