class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :group_session, foreign_key: true

      t.timestamps
    end
  end
end
