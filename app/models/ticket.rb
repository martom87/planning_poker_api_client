# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :team
  belongs_to :member

  validates :ticket_name, :ticket_description, :average_vote, presence: true
end
