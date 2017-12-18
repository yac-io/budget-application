FactoryBot.define do
  factory :transaction do
    payment_mean
    currency "USD"
    name "Test "
    amount "9.99"
    settlement_currency "EUR"
    settlement_amount "10.92"
    date "2017-12-02"
    association :user, strategy: :create
    association :account, strategy: :create
  end

  factory :transaction_invalid, class: Transaction do
    account
    payment_mean
    currency ""
    amount nil
    name "Test "
    settlement_currency "EUR"
    settlement_amount "10.92"
    date "2017-12-02"
  end
end
