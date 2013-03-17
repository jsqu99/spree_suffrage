FactoryGirl.define do
  factory :poll, :class => Spree::Poll do
    sequence(:name) { |n| "Poll ##{n} - #{Kernel.rand(9999)}" }
    sequence(:question) { |n| "Question ##{n} - #{Kernel.rand(9999)}" }
  end
end

FactoryGirl.define do
  factory :poll_answer, :class => Spree::PollAnswer do
    answer    { Faker::Lorem.sentence }
    association(:poll)
  end
end
