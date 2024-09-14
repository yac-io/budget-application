class AddIndexOnTransactionDate < ActiveRecord::Migration[7.1]
  def change
    add_index :transactions, [:account_id, :date], name: "by_account_date_idx"
    add_index :transactions, [:payment_mean_id, :date], name: "by_payment_mean_date_idx"
  end
end
