# frozen_string_literal: true

class TicketSerializer < ActiveModel::Serializer
  belongs_to :team
  belongs_to :member
  attributes :ticket_name, :average_vote
end
