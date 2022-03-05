FactoryBot.define do
  factory :user do
    nickname              { "フェイカー" }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    family_name           { "偽" }
    first_name            { "物" }
    phonenumber           { "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }
  end

  factory :admin do
    nickame { "アドミン" }
    email { "adminnansuca@exmaple.jp" }
    password { "iSOmaru0butter" }
    password_confirmation {password}
    family_name { "なんすか" }
    first_name { "ぱんすか" }
    phonenumber { "08078175944" }
    admin { Faker::Boolean.boolean(true_ratio: 2.0) }
  end
end