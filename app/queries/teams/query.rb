# frozen_string_literal: true

module Teams
  class Query
    def self.teams_with_members(team:)
      team.where('members_amount > ?', 0)
    end
  end
end
