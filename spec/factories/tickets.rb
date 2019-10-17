# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    ticket_name {Faker::Job.field}
    ticket_description {Faker::Lorem.sentence}
    average_vote {Faker::Number.between(from: 1, to: 13)}
    team
    member
  end
end
