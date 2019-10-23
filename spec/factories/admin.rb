FactoryBot.define do
  factory :admin do
    username { "Admin" }
    password  { "Password" }
    password_confirmation { "Password" }
    token { "token" }
  end
end
