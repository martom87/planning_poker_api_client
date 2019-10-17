class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.belongs_to :team, null: false, index: true, foreign_key: true
      t.string :member_name, null: false, default: ""
      t.integer :vote, null: false, default: 1
      t.timestamps
    end
  end
end
