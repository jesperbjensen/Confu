class AddMultipleUsesToToken < ActiveRecord::Migration
  def change
    add_column :tokens, :number_of_times_allowed, :int

  end
end
