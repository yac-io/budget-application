FactoryBot.define do
  factory :recurring_transaction do
    recurring_rule "MyString"
    payment_mean
    name "MyString"
    settlement_currency "MyString"
    settlement_amount "9.99"
    last_run_date nil
    active true
    association :account, strategy: :create
    association :user, strategy: :create
  end

  factory :recurring_transaction_invalid, class: RecurringTransaction do
    recurring_rule nil
    payment_mean
    name "MyString"
    settlement_currency ""
    settlement_amount "9.99"
    association :account, strategy: :create
    association :user, strategy: :create
  end
end
