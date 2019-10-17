# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    team_name {|n| "#{Faker::Team.name}#{n}"}
    members_amount {Faker::Number.between(from: 5, to: 13)}
  end
end
