class Recurring::WeeklyJob
  include Sidekiq::Job

  def perform(*args)
    recurring_rule = 'weekly'
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
end
