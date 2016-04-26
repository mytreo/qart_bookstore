FactoryGirl.define do
  factory :order do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:address)  { |n| "Some street #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    association(:user)
    price {rand(-1..1)}
  end
end