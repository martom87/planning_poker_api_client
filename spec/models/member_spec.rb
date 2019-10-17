# frozen_string_literal: true

require 'rails_helper'

describe Member, type: :model do
  describe 'validations' do
    it {should validate_presence_of :member_name}
    it {should validate_presence_of :vote}
  end

  describe 'database columns' do
    it {should have_db_column :member_name}
    it {should have_db_column :vote}
  end

  describe 'associations' do
    it {should have_many :tickets}
    it {should belong_to :team}
  end
end
