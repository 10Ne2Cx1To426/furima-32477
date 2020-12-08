FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name {Gimei.first.kanji}
    last_name {Gimei.last.kanji}
    first_name_k {Gimei.first.katakana}
    last_name_k {Gimei.last.katakana}
    birth {Faker::Date.between(from: '1990-01-01', to:'2020-12-08')}
  end
end