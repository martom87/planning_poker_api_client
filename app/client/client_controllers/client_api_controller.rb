# frozen_string_literal: true

require 'httparty'
require 'pry'
require_relative '../client_services/client_requests/make_team_service'
require_relative '../client_services/client_requests/make_team_member_service'
require_relative '../client_services/parsers/team_data'
require_relative '../client_services/data_processors/report_generator'

module ClientControllers
  class ClientApiController
    include HTTParty

    attr_reader :current_team, :team_id, :team_name
    attr_accessor :team_member_amount

    def initialize(members_amount:)
      @current_team = ClientServices::MakeTeamService.new(members_amount: members_amount).call
      @team_id = team_attributes.team_id
      @team_name = team_attributes.team_name
      @team_member_amount = team_attributes.team_member_amount
    end

    def generate_report(response)
      DataProcessors::ReportGenerator.new(response: response).call
    end

    def add_team_members(member_name, vote)
      ClientServices::MakeTeamMemberService.new(team_id: team_id, member_name: member_name, vote: vote).call
    end

    private

    def team_attributes
      @team_attributes ||= Parsers::TeamData.new(current_team: current_team)
    end
  end
end
