json.extract! transaction, :id, :account_id, :payment_mean_id, :category_id, :currency, :name, :amount, :settlement_currency, :settlement_amount, :date, :created_at, :updated_at
json.url account_transaction_url(transaction.account, transaction, format: :json)
