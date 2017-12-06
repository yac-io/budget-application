FactoryBot.define do
  factory :account do
    name 'Account name'
    currency 'usd'
    association :user, strategy: :create
  end
end