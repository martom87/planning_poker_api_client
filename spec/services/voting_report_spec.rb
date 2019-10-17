# frozen_string_literal: true

RSpec.describe VotingReport, type: :service do
  subject {described_class.new(team: team).call}

  let!(:team) {create(:team, members_amount: 1)}
  let!(:member1) {create(:member, team: team)}
  let!(:member2) {create(:member, team: team)}

  describe 'team voting report' do
    it 'should return report with members name and vote ' do
      expect(subject.dig(:members_votes, member1.member_name)).to eq(member1.vote)
      expect(subject.dig(:members_votes, member2.member_name)).to eq(member2.vote)
    end
  end
end
