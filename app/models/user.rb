class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, dependent: :destroy
  belongs_to :job

  validates :name, presence: true
  validates :admin, inclusion: { in: [true, false] }
  validates :job_id, presence: true
end
