FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password { '1a' + Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name {'田中'}
    first_name {'太郎'}
    last_name_kana {'タナカ'}
    first_name_kana {'タロウ'}
    birth_date {'1985-11-14'}
  end
end