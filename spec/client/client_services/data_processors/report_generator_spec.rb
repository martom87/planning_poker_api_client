# frozen_string_literal: true

require 'rails_helper'
require 'webmock/rspec'
require_relative '../../../../app/client/client_services/data_processors/report_generator.rb'


RSpec.describe DataProcessors::ReportGenerator, type: :service do

  let (:example_response) {{'members_votes' => {'w1' => 1}, 'votes_average' => 1.0, 'message' => 'Your team is full'}}
  let (:example_phrase) {'The average votes is 1.0'}
  subject(:report_generator) {described_class.new(response: example_response)}

  WebMock.disable_net_connect!(:allow_localhost => true)


  context 'when the response is received' do

    it 'reads members amount' do
      report = report_generator.call
      expect(report).to include(example_phrase)
    end
  end
end