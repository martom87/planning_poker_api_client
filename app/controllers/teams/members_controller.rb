# frozen_string_literal: true

module Teams
  class MembersController < ApplicationController
    def show
      render json: member, include: %i[ticket]
    end

    def index
      members = team.members
      render json: members
    end

    def create
      if TeamCapacityChecker.new(team: team).call
        render json: VotingReport.new(team: team).call.as_json.merge(message: 'Your team is full'), status: 303
      else
        team.members.create!(member_params)
        render json: {message: 'Member created'}, status: 201
      end
    end

    def update
      member.update!(member_params)
      render json: member, include: %i[ticket]
    end

    def destroy
      member.destroy!
    end

    private

    def team
      @team ||= Team.find(params[:team_id])
    end

    def member
      @member ||= team.members.find(params[:id])
    end

    def member_params
      params.permit(:member_name, :vote)
    end
  end
end
