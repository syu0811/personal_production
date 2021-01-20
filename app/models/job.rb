class Job < ApplicationRecord
  validates :name, length: { maximum: 10 }, presence: true, uniqueness: true
end
