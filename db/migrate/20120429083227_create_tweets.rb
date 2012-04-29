class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :user
      t.integer :twitter_id
      t.string :text
      t.datetime :tweet_created_at

      t.timestamps
    end
    add_index :tweets, :user_id
  end
end
