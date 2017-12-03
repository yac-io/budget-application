FactoryBot.define do
  factory :category do
    name 'category name'
  end

  factory :category_invalid, class: Category do
    name ''
  end
end
