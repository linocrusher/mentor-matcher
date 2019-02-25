class Schedtypefix < ActiveRecord::Migration[5.1]
  def change
  	change_column :group_sessions, :schedule, :datetime
  end
end
