class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :candidate
      t.references :location
      t.integer :offline_count
      t.integer :online_count

      t.timestamps
    end
  end
end
