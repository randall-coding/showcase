FactoryBot.define do
  factory :portfolio_item do
    css_class {"rails"}
    title {"Test title"}
    logo {"rails"}
    url {"https://www.gonowhere.com"}
    description { "This is a valid description" }
    image_url { "image1.png"}
  end
end
