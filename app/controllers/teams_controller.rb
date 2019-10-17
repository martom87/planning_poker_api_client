# frozen_string_literal: true

class TeamsController < ApplicationController
  def index
    render json: teams
  end

  def create
    team = CreateTeamWithName.new(team: team, members_amount: team_params[:members_amount]).call
    team.save!
    render json: team, include: %i[ticket member], status: 201

  end

  def show
    render json: team, include: %i[ticket member]
  end

  private

  def team_params
    params.permit(:members_amount, :team_name)
  end

  def team
    @team ||= Team.find(params[:id])
  end

  def teams
    @teams ||= Teams::Query.teams_with_members(team: Team.all)
  end
end
