FactoryBot.define do
  factory :student do
    firstname { 'てすと' }
    lastname { 'ゆーざー漢字' }
    birthdate { 20.years.ago }
    sequence(:number) { |n| n }
    group
  end
end
