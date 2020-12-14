FactoryBot.define do
  factory :user_order do
    number {4242424242424242}
    exp_month {2}
    exp_month {22}
    cvc {123}
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '0901234567' }
  end
end
