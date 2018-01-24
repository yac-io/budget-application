json.extract! investment, :id, :name, :isin, :quantity, :settlement_amount, :settlement_currency, :date, :account_id, :created_at, :updated_at
json.url investment_url(investment, format: :json)
