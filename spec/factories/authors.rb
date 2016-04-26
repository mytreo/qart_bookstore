FactoryGirl.define do
  factory :author do
    name {Forgery('name').full_name }
    description { "Biography:"+ Forgery(:lorem_ipsum).paragraphs(6) }
  end
end