# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe 'Teams::Members', type: :request do
  let(:team) { create(:team, members_amount: 1000) }
  let(:member) { create(:member, team: team, member_name: 'Marcin', vote: 5) }
  let(:response_json) { JSON.parse(response.body) }

  describe 'GET /teams/:id/members' do
    before { get "/teams/#{team.id}/members" }
    it 'responds with 200' do
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /teams/:id/members' do
    context 'with valid name and vote' do
      before { post "/teams/#{team.id}/members", params: params }
      let(:params) { { member_name: 'Marcin', vote: 5 } }

      it 'responds with 201' do
        expect(response.status).to eq(201)
      end
    end
  end

  describe 'GET /teams/:id/members' do
    let!(:member) { create(:member, team: team, member_name: name, vote: 5) }
    let(:name) { 'Marcin' }
    before { get "/teams/#{team.id}/members" }
    it 'returns team member attributes' do
      expect(response_json.dig('data')[0]['attributes']['member-name']).to eq(name)
    end
  end

  context 'with invalid params' do
    let(:params) { { member_name: '', vote: 0 } }

    it 'responds with 422' do
      post "/teams/#{team.id}/members", params: params
      expect(response.status).to eq(422)
    end

    it 'does not create member' do
      expect { post "/teams/#{team.id}/members" }.not_to change { Member.count }
    end
  end

  describe 'PUT  /teams/:team_id/members/:id' do
    let(:member) { create(:member, team: team, member_name: params[:member_name], vote: params[:vote]) }

    context 'with valid name' do
      before { put "/teams/#{team.id}/members/#{member.id}", params: params }
      let(:params) { { member_name: 'Marcin', vote: 5 } }

      it 'responds with 200 if update is succesful' do
        expect(response.status).to eq(200)
      end

      it 'has updated attribute' do
        expect(response_json.dig('data', 'attributes', 'member-name')).to eq(params[:member_name])
      end
    end
  end

  describe 'DELETE /teams/:team_id/members/:id' do
    let(:member) { create(:member, team: team, member_name: 'Kasia', vote: 5) }
    before { delete "/teams/#{team.id}/members/#{member.id}" }

    it 'responds with no content if delete is succesful' do
      expect(response.status).to eq(204)
    end

    context 'with invalid id' do
      let(:id) { member.id }
      before { get "/teams/#{team.id}/members/#{member.id}" }
      it 'returns 404 for invalid member id' do
        expect(response.status).to eq(404)
        expect(response_json['error']).to include("Couldn't find Member with 'id'=#{id}")
      end
    end
  end
end
