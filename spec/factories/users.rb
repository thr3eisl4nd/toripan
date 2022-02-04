FactoryBot.define do
  factory :user do
    nickname              { "フェイカー" }
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           { "偽" }
    first_name            { "物" }
    phonenumber           { "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }
  end
end