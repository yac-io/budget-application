class CreatePaymentMeans < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_means do |t|
      t.string :name
      t.string :currency
      t.belongs_to :account, foreign_key: true

      t.timestamps
    end
  end
end
