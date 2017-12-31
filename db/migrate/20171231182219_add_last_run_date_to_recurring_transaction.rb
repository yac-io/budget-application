class AddLastRunDateToRecurringTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :recurring_transactions, :last_run_date, :date
  end
end
