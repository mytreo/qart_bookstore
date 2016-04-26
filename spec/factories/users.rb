FactoryGirl.define do
  factory :user do
    sequence(:login)  { |n| "Person #{n}" }
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:address)  { |n| "Some street #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "password"
    password_confirmation "password"

    factory :admin do
      admin true
    end
  end
end