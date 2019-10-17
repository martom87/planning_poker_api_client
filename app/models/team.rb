# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :members
  has_many :tickets
  has_many :tickets, through: :members

  validates :team_name, :members_amount, presence: true
  validates :members_amount, numericality: {only_integer: true}
end
