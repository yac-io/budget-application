FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "foo#{n}@bar.com"
    end
    password { "password" }
    password_confirmation { "password" }
  end
end
