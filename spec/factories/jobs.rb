FactoryBot.define do
  factory :job do
    sequence(:name) { |n| "テスト_#{n}" }
  end
end
