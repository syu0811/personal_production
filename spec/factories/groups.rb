FactoryBot.define do
  factory :group do
    school_year { 1 }
    sequence(:number) { |n| n }
    user
  end
end
