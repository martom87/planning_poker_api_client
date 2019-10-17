# frozen_string_literal: true

class CreateDefaultMember
  def call
    Member.new.tap do |member|
      set_random_member_name(member)
      set_random_member_vote(member)
      set_random_member_team(member)
    end
  end

  private

  def set_random_member_name(member)
    member.member_name = 'unassigned'
  end

  def set_random_member_vote(member)
    member.vote = 1
  end

  def set_random_member_team(member)
    member.team = CreateDefaultTeam.new.call
  end
end
