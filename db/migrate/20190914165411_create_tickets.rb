class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.belongs_to :team, null: false, index: true, foreign_key: true
      t.string :ticket_name, null: false, default: ""
      t.text :ticket_description, null: false, default: ""
      t.decimal :average_vote, precision: 3, scale: 2, null: false, default: 1.00
      t.timestamps
    end
  end
end


