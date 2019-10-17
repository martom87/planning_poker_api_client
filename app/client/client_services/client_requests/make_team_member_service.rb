# frozen_string_literal: true

require 'httparty'
require 'json'
require_relative '../parsers/team_data'

module ClientServices
  class MakeTeamMemberService
    include HTTParty

    base_uri 'http://localhost:3000/'

    def initialize(team_id:, member_name:, vote:)
      @team_id = team_id
      @member_name = member_name
      @vote = vote
    end

    def call
      make_team_member(team_id, member_name, vote)
    end

    private

    attr_reader :team_id, :member_name, :vote

    def make_team_member(team_id, member_name, vote)
      self.class.post("/teams/#{team_id}/members",
                      query: {member_name: member_name.to_s, vote: vote})
    end
  end
end
