FactoryGirl.define do
  factory :book do
    sequence(:name)  { |n| "BookName#{n}" }
    price {rand(0..20.00)}
    quantity {rand(0..20)}
    sold {rand(0..20)}
    sequence(:description)  { |n| "Lorem ipsum#{n}" }
    year {rand(1950..2016)}
    sequence(:isbn,(11111..99999).cycle){|n| "978-596-#{n}-0"}
    association(:genre)
  end
end





