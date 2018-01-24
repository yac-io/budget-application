FactoryBot.define do
  factory :investment do
    name 'MyString'
    isin 'MyString'
    quantity 1
    settlement_amount '9.99'
    settlement_currency 'USD'
    date '2018-01-23'
    association :user, strategy: :create
    association :account, strategy: :create
  end
end
