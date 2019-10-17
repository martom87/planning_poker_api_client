# frozen_string_literal: true

RSpec.describe AverageVoteCounter, type: :service do
  subject {described_class.new(team.members).call}

  let(:team) {create(:team, members_amount: 2)}
  let(:member1) {create(:member, team: team, vote: 5)}
  let(:member2) {create(:member, team: team, vote: 13)}


  before do
    team
    member1
    member2
  end

  describe 'average vote counter' do
    it 'should return average vote' do
      expect(subject).to eq(9)
    end
  end
end



