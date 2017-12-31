json.extract! recurring_transaction, :id, :recurring_rule, :account_id, :payment_mean_id, :category_id, :name, :settlement_currency, :settlement_amount, :user_id, :created_at, :updated_at
json.url recurring_transaction_url(recurring_transaction, format: :json)
