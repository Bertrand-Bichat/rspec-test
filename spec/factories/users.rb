FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "mail#{i}@gmail.com" }
    password { 'password' }
  end
end
