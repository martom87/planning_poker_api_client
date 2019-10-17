# frozen_string_literal: true

RSpec.describe CreateRandomTicket, type: :service do
  subject {described_class.new(ticket).call}

  let(:team) {build(:team)}
  let(:ticket) {build(:ticket, team: team)}


  describe 'create random ticket' do
    it 'returns true if object is saved ' do
      expect(subject).to eq(true)
    end


  end
end
