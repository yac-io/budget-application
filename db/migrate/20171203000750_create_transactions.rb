class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.belongs_to :account, foreign_key: true
      t.belongs_to :payment_mean, foreign_key: true
      t.belongs_to :category, foreign_key: true
      t.string :name
      t.string :currency
      t.decimal :amount, precision: 8, scale: 2
      t.string :settlement_currency
      t.decimal :settlement_amount, precision: 8, scale: 2
      t.date :date

      t.timestamps
    end
  end
end
