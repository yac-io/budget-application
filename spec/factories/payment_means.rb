FactoryBot.define do
  factory :payment_mean do
    name 'Payment mean name'
    currency 'usd'
    association :account, strategy: :create
  end

  factory :payment_mean_invalid, class: PaymentMean do
    name ''
    currency ''
  end
end