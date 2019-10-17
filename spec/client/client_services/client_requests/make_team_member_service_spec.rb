# frozen_string_literal: true

require 'rails_helper'
require 'webmock/rspec'
require_relative '../../../../app/client/client_services/client_requests/make_team_member_service.rb'

RSpec.describe ClientServices::MakeTeamMemberService, type: :service do

  let (:invalid_team_id) {'foo'}
  let(:example_member_name) {'name'}
  let(:example_vote) {1}
  let(:error) {"Couldn't find Team with 'id'=#{invalid_team_id}"}
  subject(:make_team_member_service) {described_class.new(team_id: invalid_team_id, member_name: example_member_name, vote: example_vote)}

  WebMock.disable_net_connect!(:allow_localhost => true)


  context 'when team with id does not exist' do

    it 'an error message is passed' do
      response = make_team_member_service.call
      expect(response.dig('error')).to eq(error)
    end
  end

end