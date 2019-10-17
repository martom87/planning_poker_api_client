# frozen_string_literal: true

RSpec.describe TeamCapacityChecker, type: :service do
  subject {described_class.new(team: team).call}

  let(:team) {create(:team, members_amount: 1)}
  let(:member1) {create(:member, team: team)}
  let(:member2) {create(:member, team: team)}

  context 'when team is overloaded' do

    describe 'team capacity checker' do

      before do
        team
        member1
        member2
      end
      it 'should return true ' do
        expect(subject).to eq(true)
      end
    end
  end

  context 'when team is not full' do

    describe 'team capacity checker' do

      before do
        team
      end

      it 'should return true ' do
        expect(subject).to eq(false)
      end
    end
  end
end
