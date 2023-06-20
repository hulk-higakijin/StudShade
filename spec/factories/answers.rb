FactoryBot.define do
  factory :answer do
    user { nil }
    question { nil }
    content { "MyText" }
  end
end
