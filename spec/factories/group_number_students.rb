FactoryBot.define do
  factory :group_number_student do
    group
    student
    sequence(:number) { |n| n }
  end
end
