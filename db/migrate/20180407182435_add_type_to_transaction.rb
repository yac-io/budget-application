class AddTypeToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :transaction_type, :integer

    Transaction.all.each do |t|
      t.save
    end

  end
end
