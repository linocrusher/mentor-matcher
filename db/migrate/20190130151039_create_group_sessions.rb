class CreateGroupSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :group_sessions do |t|
      t.string :subject
      t.string :schedule
      t.string :venue
      t.string :topic

      t.timestamps
    end
  end
end
