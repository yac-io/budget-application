FactoryBot.define do
  factory :account do
    name { 'Account name' }
    currency { 'usd' }
    account_type { 'cash' }
    association :user, strategy: :create
  end
end
