# frozen_string_literal: true

module Parsers
  class TeamData
    attr_reader :team_id, :team_name, :team_member_amount, :current_team

    def initialize(current_team:)
      @current_team = current_team
      @team_id = current_team.dig('data', 'id')
      @team_name = current_team.dig('data', 'attributes', 'team-name')
      @team_member_amount = current_team.dig('data', 'attributes', 'members-amount')
    end
  end
end
