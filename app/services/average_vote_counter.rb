# frozen_string_literal: true

class AverageVoteCounter

  def initialize(team_members)
    @team_members = team_members
  end

  def call
    count_average_vote(team_members)
  end

  private

  attr_reader :team_members

  def count_average_vote(team_members)
    average = team_members.inject(0) {|sum, tm| sum + tm.vote}.to_f / team_members.size
    average.round(2)
  end
end
