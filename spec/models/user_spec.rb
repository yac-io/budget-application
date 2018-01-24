require 'rails_helper'

RSpec.describe User, type: :model do
  it {should have_many(:accounts)}
  it {should have_many(:categories)}
  it {should have_many(:payment_means)}
  it {should have_many(:transactions)}
  it {should have_many(:investments)}
end
