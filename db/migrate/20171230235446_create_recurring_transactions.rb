class CreateRecurringTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :recurring_transactions do |t|
      t.string :recurring_rule
      t.belongs_to :account, foreign_key: true
      t.belongs_to :payment_mean, foreign_key: true
      t.belongs_to :category, foreign_key: true
      t.string :name
      t.string :settlement_currency
      t.decimal :settlement_amount, precision: 8, scale: 2
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
