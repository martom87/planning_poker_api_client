# frozen_string_literal: true

class MemberSerializer < ActiveModel::Serializer
  attributes :member_name, :vote
  belongs_to :team
  has_many :tickets
end
