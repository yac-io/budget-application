require 'rails_helper'

RSpec.describe FormatCurrencyHelper, type: :helper do
    describe 'it formats the currency' do
      it 'amount then unit' do
        expect(helper.format_currency(1224.43,'EUR')).to eq('1,224.43 EUR')
      end

      it 'handles negative amounts' do
        expect(helper.format_currency(-1224.43,'EUR')).to eq('-1,224.43 EUR')
      end

    end
end
