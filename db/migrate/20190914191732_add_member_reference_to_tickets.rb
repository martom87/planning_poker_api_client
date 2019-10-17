class AddMemberReferenceToTickets < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :member, null: false, foreign_key: true
  end
end
