module FormatCurrencyHelper

  def format_currency(amount, unit)
    number_to_currency amount, unit: unit, format: '%n %u'
  end

end
