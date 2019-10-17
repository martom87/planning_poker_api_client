 # frozen_string_literal: true

require 'rails_helper'

describe Team, type: :model do
  describe 'validations' do
    let(:team) {create(:team)}
    it {should validate_presence_of :team_name}
    it {should validate_presence_of :members_amount}
  end

  describe 'associations' do
    it {should have_many :members}
    it {should have_many(:tickets).through(:members)}
  end

  describe 'db_columns' do
    it {should have_db_column :team_name}
    it {should have_db_column :members_amount}
  end
end
