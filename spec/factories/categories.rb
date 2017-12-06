FactoryBot.define do
  factory :category do
    name 'category name'
    association :user, strategy: :create
  end

  factory :category_invalid, class: Category do
    name ''
  end
end
