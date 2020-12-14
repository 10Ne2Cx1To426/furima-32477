FactoryBot.define do
  factory :user_order do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    house_number { '1-1' }
    building { '東京ハイツ' }
    phone_number { '0901234567' }
  end
end
