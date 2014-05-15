# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :brigade do
    sequence(:name) { |n| "Brigade #{n}" }
  end
end
