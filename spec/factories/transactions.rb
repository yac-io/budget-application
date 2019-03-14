FactoryBot.define do
  factory :transaction do
    currency { "USD" }
    name { "Test " }
    amount { "9.99" }
    settlement_currency { "EUR" }
    settlement_amount { "10.92" }
    date { "2017-12-02" }
    association :user, strategy: :create
    association :account, strategy: :create
    association :payment_mean, strategy: :create
  end

  factory :transaction_invalid, class: Transaction do
    account
    payment_mean
    currency { "" }
    amount { nil }
    name { "" }
    settlement_currency { "EUR" }
    settlement_amount { "10.92" }
    date { "2017-12-02" }
  end
end
