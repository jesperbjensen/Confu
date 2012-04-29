class AddTwitterNameIndexToUser < ActiveRecord::Migration
  def change
    add_index :users, :twitter_name
  end
end
