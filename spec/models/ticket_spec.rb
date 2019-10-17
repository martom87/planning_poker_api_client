# frozen_string_literal: true

require 'rails_helper'

describe Ticket, type: :model do
  describe 'validations' do
    let(:ticket) {create(:ticket)}
    it {should validate_presence_of :ticket_name}
    it {should validate_presence_of :ticket_description}
    it {should validate_presence_of :average_vote}
  end

  describe 'database columns' do
    it {should have_db_column :ticket_name}
    it {should have_db_column :ticket_description}
    it {should have_db_column :average_vote}
  end

  describe 'associations' do
    it {should belong_to :team}
    it {should belong_to :member}
  end
end
