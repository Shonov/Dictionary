class AddIndexToWord < ActiveRecord::Migration[5.1]
  def change
    add_column :words, :user_id, :integer
  end
end
