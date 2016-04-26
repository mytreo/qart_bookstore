FactoryGirl.define do
  factory :author do
    sequence(:name)  { |n| "Person #{n}" }
    description "Lorem ipsum"
  end
end