class Typetot < ActiveRecord::Migration[5.1]
  def change
  	rename_column :feedbacks, :type, :t
  end
end
