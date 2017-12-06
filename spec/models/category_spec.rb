require 'rails_helper'

RSpec.describe Category, type: :model do
  it {should have_many(:transactions)}
  it {should belong_to(:user)}

  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:user)}
end
