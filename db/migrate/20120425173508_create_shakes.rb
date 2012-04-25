class CreateShakes < ActiveRecord::Migration
  def change
    create_table :shakes do |t|
      t.references :source_user
      t.references :dest_user

      t.timestamps
    end
    add_index :shakes, :source_user_id
    add_index :shakes, :dest_user_id
  end
end
