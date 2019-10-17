# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Teams API', type: :request do
  describe 'POST /teams' do
    before { post '/teams', params: params }
    context 'with valid name' do
      let(:params) { { members_amount: 5 } }
      it 'responds with 201' do

        expect(response.status).to eq(201)
      end
    end
  end
end
