# frozen_string_literal: true

class CreateTeamWithName

  def initialize(team:, members_amount:)
    @team = team
    @members_amount = members_amount
  end

  def call
    team_creator
  end

  private

  attr_reader :team, :members_amount

  def team_creator
    Team.new.tap do |team|
      set_random_team_name(team)
      set_members_amount(team)
    end
  end

  def set_random_team_name(team)
    team.team_name = Faker::Team.name
  end

  def set_members_amount(team)
    team.members_amount = members_amount
  end

end
