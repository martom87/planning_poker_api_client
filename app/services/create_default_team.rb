# frozen_string_literal: true

class CreateDefaultTeam
  def call
    set_default_team
  end

  private

  def set_default_team
    Team.new(team_name: 'default', members_amount: 1)
  end
end
