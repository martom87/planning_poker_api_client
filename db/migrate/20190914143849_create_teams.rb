class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.column :team_name, :string, null: false, default: ""
      t.column :members_amount, :integer, null: false, default: 0
      t.timestamps
    end
  end
end
