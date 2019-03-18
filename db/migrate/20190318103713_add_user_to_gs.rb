class AddUserToGs < ActiveRecord::Migration[5.1]
  def change
    add_reference :group_sessions, :user, foreign_key: true
  end
end
