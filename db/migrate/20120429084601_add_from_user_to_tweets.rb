class AddFromUserToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :from_user, :string

  end
end
