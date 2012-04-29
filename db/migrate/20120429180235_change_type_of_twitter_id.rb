class ChangeTypeOfTwitterId < ActiveRecord::Migration
  def up
    change_column(:tweets, :twitter_id, :decimal)
  end

  def down
  end
end
