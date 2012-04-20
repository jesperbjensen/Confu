class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :code
      t.references :badge

      t.timestamps
    end
    add_index :tokens, :badge_id
  end
end
