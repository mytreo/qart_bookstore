FactoryGirl.define do
  factory :line_item do
    price {rand(0..20.00)}
    quantity {rand(0..20)}
    association(:book)

    factory :cart_line_item do
      association(:order)
    end

    factory :order_line_item do
      association(:cart)
    end

  end
end