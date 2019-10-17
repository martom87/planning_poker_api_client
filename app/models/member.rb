# frozen_string_literal: true

class Member < ApplicationRecord
  has_many :tickets
  belongs_to :team
  validates :member_name, :vote, presence: true
  validates_inclusion_of :vote, in: (1..13)
end
