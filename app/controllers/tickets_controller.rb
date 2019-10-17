# frozen_string_literal: true

class TicketsController < ApplicationController
  def create
    ticket = CreateRandomTicket.new(ticket).call
    render json: ticket, status: 201
  end


end
