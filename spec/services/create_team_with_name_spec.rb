# frozen_string_literal: true

RSpec.describe CreateTeamWithName, type: :service do
  subject {described_class.new(team: team, members_amount: team.members_amount).call}

  let(:team) {build(:team, members_amount: 2, team_name: "Super Team")}

  describe 'create team' do
    it 'returns true if object is saved ' do
      expect(subject.team_name).to_not eq("Super Team")
    end
  end
end

