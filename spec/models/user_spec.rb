require 'rails_helper'

RSpec.describe User, type: :model do
  it {is_expected.to have_many(:accounts)}
  it {is_expected.to have_many(:categories)}
  it {is_expected.to have_many(:payment_means)}
  it {is_expected.to have_many(:transactions)}
  it {is_expected.to have_many(:investments)}
end
