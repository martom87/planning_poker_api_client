# frozen_string_literal: true

class TeamSerializer < ActiveModel::Serializer
  has_many :tickets
  has_many :members, through: :tickets
  attributes :team_name, :members_amount
end
