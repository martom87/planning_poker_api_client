# frozen_string_literal: true

class TeamCapacityChecker
  def initialize(team:)
    @team = team
  end

  def call
    is_team_overcharged?(team)
  end

  private

  attr_reader :team

  def is_team_overcharged?(team)
    team.members_amount <= team.members.size
  end
end
