# frozen_string_literal: true

require 'json'
class VotingReport
  def initialize(team:)
    @team = team
  end

  def call
    generate_report(team)
  end

  private

  attr_reader :team

  def generate_report(team)
    report_hash = Hash[team.members.collect {|member| [member.member_name, member.vote]}]
    {members_votes: report_hash, votes_average: count_average(team)}
  end

  def count_average(team)
    AverageVoteCounter.new(team.members).call
  end

end
