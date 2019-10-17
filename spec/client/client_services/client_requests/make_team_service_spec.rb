# frozen_string_literal: true

require 'rails_helper'
require 'webmock/rspec'
require_relative '../../../../app/client/client_services/client_requests/make_team_service.rb'


RSpec.describe ClientServices::MakeTeamService, type: :service do

  let (:invalid_string_members_amount) {'foo'}
  let(:error_message) {'is not a number'}
  subject(:make_team_service) {described_class.new(members_amount: invalid_string_members_amount)}

  WebMock.disable_net_connect!(:allow_localhost => true)


  context 'when members_amount type is incorrect' do

    it 'an error message is passed' do
      response = make_team_service.call
      expect(response.dig('members_amount').join).to eq(error_message)
    end
  end
end