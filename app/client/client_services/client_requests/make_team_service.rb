# frozen_string_literal: true

require 'httparty'
require 'json'
require 'pry'
module ClientServices
  class MakeTeamService
    include HTTParty

    base_uri 'http://localhost:3000/'

    def initialize(members_amount:)
      @members_amount = members_amount
    end

    def call
      make_team
    end

    private


    attr_reader :members_amount


    def make_team
      self.class.post('/teams', query: {members_amount: members_amount.to_s})
    end
  end
end
