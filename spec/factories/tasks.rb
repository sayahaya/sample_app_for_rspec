FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "Titlet #{n}" }
    status { 0 }  
    association :user
  end
end
