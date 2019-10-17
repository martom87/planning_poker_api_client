# frozen_string_literal: true

FactoryBot.define do
  factory :member do
    member_name {Faker::Movies::StarWars.character}
    vote {Faker::Number.between(from: 1, to: 13)}
    team
  end
end
