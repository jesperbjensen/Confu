class AddMinimumTimeBetweenScansInMinutesToToken < ActiveRecord::Migration
  def change
    add_column :tokens, :minimum_time_between_scans_in_minutes, :int

  end
end
