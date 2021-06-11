FactoryBot.define do
  factory :post do
    sequence(:name) { |i| "Titre #{i}" }
    comments_count { 0 }
  end
end
