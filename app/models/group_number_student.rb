class GroupNumberStudent < ApplicationRecord
  belongs_to :group
  belongs_to :student

  validates :group_id, presence: true
  validates :student_id, presence: true
  validates :number, presence: true, uniqueness: { scope: [:student_id, :group_id] }

  def get_next_number(group_id, student_id)
    next_number = GroupNumberStudent.select("number").where(group_id: group_id).order("number DESC").limit(1).offset(0)
  end
end
