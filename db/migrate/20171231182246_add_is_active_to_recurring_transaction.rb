class AddIsActiveToRecurringTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :recurring_transactions, :active, :boolean, optional: false, default: true
  end
end
