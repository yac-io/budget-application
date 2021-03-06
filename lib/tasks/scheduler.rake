desc 'Execute daily recurring transactions'

task process_daily_recurring_transactions: :environment do
  process_recurring_transactions('daily')
end

task process_weekly_recurring_transactions: :environment do
  process_recurring_transactions('weekly') if Time.zone.now.days_to_week_start == 0
end

task process_monthly_recurring_transactions: :environment do
  process_recurring_transactions('monthly') if Time.zone.now.day == 1
end

task process_yearly_recurring_transactions: :environment do
  process_recurring_transactions('yearly') if Time.zone.now.day == 1 && Time.zone.now.month == 1
end


def process_recurring_transactions(recurring_rule)
  RecurringTransaction.where('active = ? and recurring_rule = ?', true, recurring_rule).each do |recurring_transaction|
    transaction = Transaction.new
    transaction.user = recurring_transaction.user
    transaction.name = recurring_transaction.name
    transaction.account = recurring_transaction.account
    transaction.category = recurring_transaction.category
    transaction.payment_mean = recurring_transaction.payment_mean
    transaction.settlement_currency = recurring_transaction.settlement_currency
    transaction.settlement_amount = recurring_transaction.settlement_amount
    transaction.currency = recurring_transaction.settlement_currency
    transaction.amount = recurring_transaction.settlement_amount
    transaction.date = Time.zone.now
    transaction.save!
    recurring_transaction.last_run_date = Time.zone.now
    recurring_transaction.save!
  end
end
