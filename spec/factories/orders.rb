FactoryGirl.define do
  factory :order do
    name {Forgery('name').full_name }
    sequence(:address)  { |n| "Some street #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    association(:user)
    status {rand(-1..1)}
  end
end