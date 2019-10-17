# frozen_string_literal: true

class CreateRandomTicket

  attr_reader :ticket

  def initialize(ticket)
    @ticket = ticket
  end

  def call
    ticket_creator
  end

  private

  def ticket_creator
    ticket = Ticket.new.tap do |ticket|
      set_ticket_name(ticket)
      set_ticket_description(ticket)
      set_ticket_team(ticket)
      set_ticket_member(ticket)
    end
    ticket.save
  end

  def set_ticket_name(ticket)
    ticket.ticket_name = Faker::Job.field
  end

  def set_ticket_description(ticket)
    ticket.ticket_description = Faker::Lorem.sentence
  end

  def set_ticket_team(ticket)
    ticket.team = CreateDefaultTeam.new.call
  end

  def set_ticket_member(ticket)
    ticket.member = CreateDefaultMember.new.call
  end

end
