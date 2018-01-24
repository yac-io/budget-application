class CreateInvestments < ActiveRecord::Migration[5.1]
  def change
    create_table :investments do |t|
      t.string :name, null: false
      t.string :isin, null: false
      t.integer :quantity, null: false
      t.decimal :settlement_amount, precision: 8, scale: 2, null: false
      t.string :settlement_currency, null: false
      t.date :date, null: false
      t.belongs_to :user, foreign_key: true, index: true, null: false
      t.belongs_to :account, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
