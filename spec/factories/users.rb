FactoryBot.define do
  factory :user do
    email {'fake@fake.com'}
    password {'password'}
    password_confirmation {'password'}
  end
end
