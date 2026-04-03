namespace :recurring do
  desc "Run recurring transactions"
  task daily: :environment do
    recurring_rule = 'daily'
    RecurringTransaction.where('active = ? and recurring_rule = ?', true, recurring_rule).find_each do |recurring_transaction|
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

  task monthly: :environment do
    recurring_rule = 'monthly'
    # Fly cron runs on UTC, while the app stores/display dates in `Time.zone`
    # (Pacific Time). When the job runs close to midnight UTC, `Time.zone.now`
    # can still be in the previous month, producing "previous month" dates.
    now_utc = Time.now.utc
    RecurringTransaction.where('active = ? and recurring_rule = ?', true, recurring_rule).find_each(batch_size: 1) do |recurring_transaction|
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
      transaction.date = Time.zone.local(now_utc.year, now_utc.month, 1)
      transaction.save!
      recurring_transaction.last_run_date = transaction.date
      recurring_transaction.save!
    end
  end

  task weekly: :environment do
    recurring_rule = 'weekly'
    RecurringTransaction.where('active = ? and recurring_rule = ?', true, recurring_rule).find_each(batch_size: 1) do |recurring_transaction|
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

  task yearly: :environment do
    recurring_rule = 'yearly'
    now_utc = Time.now.utc
    RecurringTransaction.where('active = ? and recurring_rule = ?', true, recurring_rule).find_each(batch_size: 1) do |recurring_transaction|
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
      transaction.date = Time.zone.local(now_utc.year, 1, 1)
      transaction.save!
      recurring_transaction.last_run_date = transaction.date
      recurring_transaction.save!
    end
  end

end


